import 'dart:ui';

import 'package:flutter/material.dart' as material;
import 'package:flutter/services.dart';

class ClusterIcon {
  ClusterIcon(this.clusterIconTemplatePath, this.count);
  final String clusterIconTemplatePath;
  final int count;

  Future<Image> _drawIcon() async {
    final imageByteData = await rootBundle.load(clusterIconTemplatePath);
    final imageCodec = await instantiateImageCodec(
      imageByteData.buffer.asUint8List(),
    );
    final frameInfo = await imageCodec.getNextFrame();

    final image = frameInfo.image;

    final pictureRecorder = PictureRecorder();
    final iconCanvas = Canvas(pictureRecorder);
    iconCanvas.drawImage(image, Offset.zero, Paint());

    final textPainter = material.TextPainter(
      text: material.TextSpan(
        text: count.toString(),
        style: const material.TextStyle(
          fontSize: 32,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(maxWidth: image.width.toDouble());
    textPainter.paint(
        iconCanvas,
        Offset(
          (image.width - textPainter.width) / 2,
          (image.height - textPainter.height) / 2 * 0.8,
        ));
    textPainter.dispose();

    return await pictureRecorder
        .endRecording()
        .toImage(image.width, image.height);
  }

  Future<Uint8List> asBytes() async {
    final pngBytes = await (await _drawIcon()).toByteData(
      format: ImageByteFormat.png,
    );
    assert(pngBytes != null);
    return pngBytes!.buffer.asUint8List();
  }
}
