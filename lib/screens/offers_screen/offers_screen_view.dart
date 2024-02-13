import 'package:flutter/material.dart';
import 'package:luncher/generated/l10n.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Center(child: Text(S.of(context).offers)),
    );
  }
}
