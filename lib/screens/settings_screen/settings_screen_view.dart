import 'package:flutter/material.dart';

import 'package:luncher/generated/l10n.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).settings)),
      body: Placeholder(
        child: Center(
          child: Text(
            S.of(context).settings,
          ),
        ),
      ),
    );
  }
}
