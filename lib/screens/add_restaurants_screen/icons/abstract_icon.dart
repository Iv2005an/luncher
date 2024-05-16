import 'dart:typed_data';
import 'dart:ui';

abstract class AbstractIcon {
  AbstractIcon(this.iconSize);
  final Size iconSize;
  final pictureRecorder = PictureRecorder();
  late final Canvas canvas = Canvas(pictureRecorder);

  Future<void> draw();

  Future<Uint8List> asBytes() async {
    await draw();
    final pngBytes = await (await pictureRecorder
            .endRecording()
            .toImage(iconSize.width.toInt(), iconSize.height.toInt()))
        .toByteData(
      format: ImageByteFormat.png,
    );
    assert(pngBytes != null);
    return pngBytes!.buffer.asUint8List();
  }
}
