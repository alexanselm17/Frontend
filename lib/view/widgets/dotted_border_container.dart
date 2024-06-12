import 'package:flutter/material.dart';

class DottedBorderContainer extends StatelessWidget {
  final Widget child;

  const DottedBorderContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DottedBorderPainter(),
      child: child,
    );
  }
}

class DottedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gap;

  DottedBorderPainter({
    this.color = Colors.black,
    this.strokeWidth = 2.0,
    this.gap = 4.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    const dashWidth = 5.0;
    final dashSpace = gap;

    var currentDistance = 0.0;
    final pathMetrics = path.computeMetrics().toList();

    while (
        currentDistance < pathMetrics.fold(0, (prev, m) => prev + m.length)) {
      final pathMetric = pathMetrics.firstWhere(
        (metric) => metric.length > currentDistance,
        //orElse: () => null,
      );

      final extractPath =
          pathMetric.extractPath(currentDistance, currentDistance + dashWidth);

      canvas.drawPath(extractPath, paint);

      currentDistance += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
