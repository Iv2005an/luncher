import 'package:flutter/material.dart';

class MyPositionButton extends StatelessWidget {
  const MyPositionButton(
    this.onPressed, {
    super.key,
  });
  final Future<void> Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, bottom: 32),
      child: Align(
        alignment: Alignment.bottomRight,
        child: IconButton.filled(
          onPressed: () async => await onPressed(),
          iconSize: 48,
          icon: const Icon(
            Icons.navigation,
          ),
        ),
      ),
    );
  }
}
