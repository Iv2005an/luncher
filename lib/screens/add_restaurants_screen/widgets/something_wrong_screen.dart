import 'package:flutter/material.dart';
import 'package:luncher/generated/l10n.dart';
import 'package:luncher/screens/add_restaurants_screen/bloc/add_restaurants_screen_bloc.dart';

class SomethingWrongScreen extends StatelessWidget {
  const SomethingWrongScreen(this._bloc, {super.key});
  final AddRestaurantsScreenBloc _bloc;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(S.of(context).somethingWentWrong),
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: () => _bloc.add(LoadRestaurants()),
            child: Text(S.of(context).tryAgain),
          )
        ],
      ),
    );
  }
}
