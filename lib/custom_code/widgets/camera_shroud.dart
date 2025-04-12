// Automatic FlutterFlow imports
// Imports other custom widgets
// Imports custom actions
// Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// my imports
import 'package:camerawesome/camerawesome_plugin.dart';

class BarcodeFocusAreaPainter extends CustomPainter {
  final Size scanArea;
  final Rect? barcodeRect;
  final CanvasTransformation? canvasTransformation;

  BarcodeFocusAreaPainter({
    required this.scanArea,
    required this.barcodeRect,
    this.canvasTransformation,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final clippedRect = getClippedRect(size);
    // Draw a semi-transparent overlay outside of the scan area
    canvas.drawPath(
      clippedRect,
      Paint()..color = Colors.black38,
    );
    canvas.drawLine(
      Offset(size.width / 2 - scanArea.width / 2, size.height / 2),
      Offset(size.width / 2 + scanArea.width / 2, size.height / 2),
      Paint()
        ..color = Colors.red
        ..strokeWidth = 2,
    );
    // Add border around the scan area
    canvas.drawPath(
      getInnerRect(size),
      Paint()
        ..style = PaintingStyle.stroke
        ..color = Colors.white70
        ..strokeWidth = 3,
    );

    // We apply the canvas transformation to the canvas so that the barcode
    // rect is drawn in the correct orientation. (Android only)
    if (canvasTransformation != null) {
      canvas.save();
      canvas.applyTransformation(canvasTransformation!, size);
    }

    // Draw the barcode rect for debugging purpose
    // if (barcodeRect != null) {
    //   // apply canvas transformation
    //   canvas.drawRect(
    //     barcodeRect!,
    //     Paint()
    //       ..style = PaintingStyle.stroke
    //       ..color = Colors.blue
    //       ..strokeWidth = 2,
    //   );
    // }

    // if you want to draw without canvas transformation, use this:
    // if (canvasTransformation != null) {
    //   canvas.restore();
    // }
  }

  Path getInnerRect(Size size) {
    return Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            (size.width - scanArea.width) / 2,
            (size.height - scanArea.height) / 2,
            scanArea.width,
            scanArea.height,
          ),
          const Radius.circular(32),
        ),
      );
  }

  Path getClippedRect(Size size) {
    final fullRect = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    final innerRect = getInnerRect(size);
    // Substract innerRect from fullRect
    return Path.combine(
      PathOperation.difference,
      fullRect,
      innerRect,
    );
  }

  @override
  bool shouldRepaint(covariant BarcodeFocusAreaPainter oldDelegate) {
    return scanArea != oldDelegate.scanArea &&
        canvasTransformation != oldDelegate.canvasTransformation &&
        barcodeRect != oldDelegate.barcodeRect;
  }
}

extension RenderObjectExtensions on RenderObject {
  Offset localToGlobal(Offset localPosition) {
    final transform = getTransformTo(null);
    return MatrixUtils.transformPoint(transform, localPosition);
  }
}
