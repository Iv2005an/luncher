import 'package:flutter/material.dart';

import 'package:luncher/generated/l10n.dart';
import 'package:luncher/repositories/fastfood_repository/models/models.dart';
import 'package:luncher/screens/restaurants_screen/bloc/restaurants_screen_bloc.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard(
    this._restaurantsScreenBloc,
    this._restaurant, {
    super.key,
  });
  final RestaurantsScreenBloc _restaurantsScreenBloc;
  final AbstractRestaurantModel _restaurant;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_restaurant.address, style: theme.textTheme.headlineSmall),
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
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(S.of(context).deleting),
                        content: Text(S.of(context).deleteRestaurant),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(S.of(context).cancel),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              _restaurantsScreenBloc
                                  .add(DeleteRestaurant(_restaurant));
                            },
                            child: Text(S.of(context).delete),
                          ),
                        ],
                      ),
                    ),
                    child: Text(
                      S.of(context).delete,
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: Colors.red),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
