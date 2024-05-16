import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:luncher/screens/restaurants_screen/models/fastfood_info.dart';

class FastfoodLogo extends StatelessWidget {
  const FastfoodLogo(
    this._fastfoodInfo, {
    super.key,
  });
  final FastfoodInfo _fastfoodInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SvgPicture.asset(
        _fastfoodInfo.assetLogo,
        height: 48,
        colorFilter: _fastfoodInfo.monochromeAssetLogo
            ? ColorFilter.mode(
                Theme.of(context).colorScheme.onSurface, BlendMode.srcIn)
            : null,
      ),
    );
  }
}
