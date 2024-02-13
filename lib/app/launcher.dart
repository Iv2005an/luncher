import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import 'package:luncher/generated/l10n.dart';

class Launcher extends StatelessWidget {
  const Launcher(this._statefulNavigationShell, {super.key});
  final StatefulNavigationShell _statefulNavigationShell;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pagesNames = [
      S.of(context).restaurants,
      S.of(context).wishes,
      S.of(context).offers
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pagesNames[_statefulNavigationShell.currentIndex],
          style: theme.textTheme.headlineSmall,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor:
              theme.colorScheme.secondaryContainer, // Navigation bar
        ),
        actions: [
          IconButton(
              onPressed: () => context.push('/settings'),
              icon: const Icon(Icons.settings))
        ],
      ),
      body: _statefulNavigationShell,
      bottomNavigationBar: NavigationBar(
          selectedIndex: _statefulNavigationShell.currentIndex,
          onDestinationSelected: (index) => _statefulNavigationShell.goBranch(
              index,
              initialLocation: index == _statefulNavigationShell.currentIndex),
          destinations: [
            NavigationDestination(
                icon: const Icon(Icons.food_bank_outlined),
                selectedIcon: const Icon(Icons.food_bank),
                label: pagesNames[0]),
            NavigationDestination(
                icon: const Icon(Icons.fastfood_outlined),
                selectedIcon: const Icon(Icons.fastfood),
                label: pagesNames[1]),
            NavigationDestination(
                icon: const Icon(Icons.summarize_outlined),
                selectedIcon: const Icon(Icons.summarize),
                label: pagesNames[2]),
          ]),
    );
  }
}
