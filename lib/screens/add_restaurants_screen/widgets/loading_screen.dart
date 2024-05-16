import 'package:flutter/material.dart';
import 'package:luncher/generated/l10n.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator.adaptive(),
          const SizedBox(height: 16),
          Text(S.of(context).uploadingInformationAboutRestaurants),
        ],
      ),
    );
  }
}
