import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:luncher/app/launcher.dart';
import 'package:luncher/screens/restaurants_screen/models/franchise_info.dart';
import 'package:luncher/screens/screens.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/wishes',
  routes: [
    StatefulShellRoute.indexedStack(
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(
              path: '/restaurants',
              builder: (context, state) => const RestaurantsScreen(),
              routes: [
                GoRoute(
                  path: 'addRestaurant',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (context, state) => AddRestaurantScreen(
                    state.extra as FranchiseInfo,
                  ),
                )
              ]),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/wishes',
            builder: (context, state) => const WishesScreen(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/offers',
            builder: (context, state) => const OffersScreen(),
          ),
        ]),
      ],
      builder: (context, state, navigationShell) => Launcher(navigationShell),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    )
  ],
);
