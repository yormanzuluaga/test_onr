import 'package:flutter/material.dart';

extension SizeAndPositionExtension on BuildContext {
  Rect? get globalPaintBounds {
    final renderObject = findRenderObject();
    final translation = renderObject?.getTransformTo(null).getTranslation();
    if (translation != null && renderObject?.paintBounds != null) {
      final offset = Offset(translation.x, translation.y);
      return renderObject!.paintBounds.shift(offset);
    } else {
      return null;
    }
  }

  Offset? getPosition({Offset offset = Offset.zero}) => (findRenderObject() as RenderBox?)?.localToGlobal(offset);

  Size? getSize() => (findRenderObject() as RenderBox?)?.size;
}
