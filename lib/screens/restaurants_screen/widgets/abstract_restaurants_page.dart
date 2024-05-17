import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:luncher/generated/l10n.dart';
import 'package:luncher/screens/restaurants_screen/widgets/add_restaurant_button.dart';
import 'package:luncher/screens/restaurants_screen/widgets/fastfood_logo.dart';
import 'package:luncher/screens/widgets/loading_screen.dart';
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
    _restaurantsScreenBloc.add(LoadRestaurantsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantsScreenBloc, RestaurantsScreenState>(
      bloc: _restaurantsScreenBloc,
      builder: (context, state) {
        Widget page = const LoadingScreen();
        if (state is RestaurantsScreenLoaded) {
          page = Expanded(
              child: PageView.builder(
            controller: PageController(initialPage: state.selectedRestaurantId),
            onPageChanged: (value) => _restaurantsScreenBloc
                .add(SelectRestaurantEvent(state.restaurants[value].id)),
            itemCount: state.restaurants.length,
            itemBuilder: (context, index) => RestaurantCard(
                _restaurantsScreenBloc, state.restaurants[index]),
          ));
        }
        if (state is RestaurantsScreenEmpty) {
          page = Text(S.of(context).noRestaurant);
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
