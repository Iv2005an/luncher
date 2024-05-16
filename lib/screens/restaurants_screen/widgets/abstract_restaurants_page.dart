import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:luncher/generated/l10n.dart';
import 'package:luncher/screens/restaurants_screen/widgets/add_restaurant_button.dart';
import 'package:luncher/screens/restaurants_screen/widgets/fastfood_logo.dart';
import '../bloc/restaurants_screen_bloc.dart';
import '../models/fastfood_info.dart';
import 'restaurant_card.dart';

abstract class AbstractRestaurantPage extends StatefulWidget {
  const AbstractRestaurantPage(
    this._fastfoodInfo, {
    super.key,
  });
  final FastfoodInfo _fastfoodInfo;

  @override
  State<AbstractRestaurantPage> createState() => _AbstractRestaurantPageState();
}

class _AbstractRestaurantPageState extends State<AbstractRestaurantPage> {
  late final RestaurantsScreenBloc _restaurantsScreenBloc =
      RestaurantsScreenBloc(widget._fastfoodInfo.fastfoodRepository);

  @override
  void initState() {
    _restaurantsScreenBloc.add(LoadRestaurants());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<RestaurantsScreenBloc, RestaurantsScreenState>(
      bloc: _restaurantsScreenBloc,
      builder: (context, state) {
        Widget page = Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator.adaptive(),
              const SizedBox(height: 16),
              Text(S.of(context).uploadingInformationAboutRestaurants),
            ],
          ),
        );
        if (state is RestaurantsScreenLoaded) {
          page = Expanded(
              child: PageView.builder(
            controller: PageController(initialPage: state.selectedRestaurantId),
            onPageChanged: (value) => _restaurantsScreenBloc
                .add(SelectRestaurant(state.restaurants[value].id)),
            itemCount: state.restaurants.length,
            itemBuilder: (context, index) => RestaurantCard(
                _restaurantsScreenBloc, state.restaurants[index]),
          ));
        }
        if (state is RestaurantsScreenEmpty) {
          page = Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    widget._fastfoodInfo.assetLogo,
                    height: 48,
                    colorFilter: widget._fastfoodInfo.monochromeAssetLogo
                        ? ColorFilter.mode(
                            Theme.of(context).colorScheme.onSurface,
                            BlendMode.srcIn)
                        : null,
                  ),
                ),
                page = Text(S.of(context).noRestaurant),
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                        onPressed: () => context.push(
                            '/restaurants/addRestaurant',
                            extra: widget._fastfoodInfo),
                        child: Text(
                          S.of(context).addRestaurant,
                          style: TextStyle(color: theme.colorScheme.onSurface),
                        ),
                      ),
                    ))
                  ],
                )
              ]);
        }
        return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FastfoodLogo(widget._fastfoodInfo),
              page,
              AddRestaurantButton(widget._fastfoodInfo)
            ]);
      },
    );
  }
}
