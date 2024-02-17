import 'dart:ui';

import 'package:flutter/material.dart' as material;
import 'package:flutter/services.dart';

import 'abstract_icon.dart';

class ClusterIcon extends AbstractIcon {
  ClusterIcon(this.clusterIconTemplatePath, this.count)
      : super(const Size(100, 150));
  final String clusterIconTemplatePath;
  final int count;

  @override
  Future<void> draw() async {
    final imageByteData = await rootBundle.load(clusterIconTemplatePath);
    final imageCodec = await instantiateImageCodec(
      imageByteData.buffer.asUint8List(),
    );
    final frameInfo = await imageCodec.getNextFrame();

    canvas.drawImage(frameInfo.image, Offset.zero, Paint());

    final textPainter = material.TextPainter(
      text: material.TextSpan(
        text: count.toString(),
        style: const material.TextStyle(
          fontSize: 32,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(maxWidth: iconSize.width);
    textPainter.paint(
        canvas,
        Offset(
          (iconSize.width - textPainter.width) / 2,
          (iconSize.width - textPainter.height) / 2,
        ));
    textPainter.dispose();
  }
}
