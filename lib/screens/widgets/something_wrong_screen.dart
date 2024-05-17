import 'package:flutter/material.dart';
import 'package:luncher/generated/l10n.dart';

class SomethingWrongScreen extends StatelessWidget {
  const SomethingWrongScreen(this._onPressed, {super.key});
  final Function _onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(S.of(context).somethingWentWrong),
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: () => _onPressed(),
            child: Text(S.of(context).tryAgain),
          )
        ],
      ),
    );
  }
}
