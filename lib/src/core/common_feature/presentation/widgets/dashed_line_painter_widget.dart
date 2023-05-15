import 'package:flutter/material.dart';

class DashedLinePainterWidget extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;

  DashedLinePainterWidget({
    required this.color,
    required this.strokeWidth,
    required this.dashWidth,
    required this.dashSpace,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double startX = 0;
    double endX = size.width;
    double centerY = size.height / 2;

    Path dashPath = Path();
    while (startX < endX) {
      dashPath.moveTo(startX, centerY);
      dashPath.lineTo(startX + dashWidth, centerY);
      startX += dashWidth + dashSpace;
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(DashedLinePainterWidget oldDelegate) {
    return color != oldDelegate.color ||
        strokeWidth != oldDelegate.strokeWidth ||
        dashWidth != oldDelegate.dashWidth ||
        dashSpace != oldDelegate.dashSpace;
  }
}