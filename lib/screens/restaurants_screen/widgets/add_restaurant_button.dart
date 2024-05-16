import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:luncher/generated/l10n.dart';
import 'package:luncher/screens/restaurants_screen/models/fastfood_info.dart';

class AddRestaurantButton extends StatelessWidget {
  const AddRestaurantButton(
    this._fastfoodInfo, {
    super.key,
  });

  final FastfoodInfo _fastfoodInfo;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutlinedButton(
            onPressed: () => context.push('/restaurants/addRestaurant',
                extra: _fastfoodInfo),
            child: Text(
              S.of(context).addRestaurant,
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
            ),
          ),
        ))
      ],
    );
  }
}
