import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:luncher/generated/l10n.dart';
import 'package:luncher/repositories/fastfood_repository/models/models.dart';
import 'package:luncher/screens/add_restaurants_screen/bloc/add_restaurants_screen_bloc.dart';

class AddRestaurantBottomSheet extends StatelessWidget {
  const AddRestaurantBottomSheet(
    this._bloc,
    this._restaurant, {
    super.key,
  });

  final AddRestaurantsScreenBloc _bloc;
  final AbstractRestaurantModel _restaurant;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _restaurant.address,
              style: theme.textTheme.headlineSmall,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(_restaurant.city.name),
            ),
            ListView(
              shrinkWrap: true,
              children: [
                for (var metro in _restaurant.metroList)
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(metro.color),
                    ),
                    title: Text(metro.name),
                    subtitle: Text('${metro.distance.toInt()} м'),
                  )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                      onPressed: () {
                        _bloc.add(AddRestaurantEvent(_restaurant));
                        context.pushReplacement('/restaurants');
                      },
                      child: Text(
                        S.of(context).addRestaurant,
                        style: theme.textTheme.bodyMedium,
                      )),
                ),
              ],
            )
          ]),
    );
  }
}
