import 'package:flutter/material.dart';

class GraphPainter extends CustomPainter {
  final List<double> stressData;
  final List<double> relaxData;
  final List<double> calmData;
  final List<double> hrData;

  GraphPainter({
    required this.stressData,
    required this.relaxData,
    required this.calmData,
    required this.hrData,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint stressPaint = Paint()
      ..color = Colors.red.shade300
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    Paint relaxPaint = Paint()
      ..color = Colors.green.shade200
      ..style = PaintingStyle.fill;

    Paint calmPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    Paint hrPaint = Paint()
      ..color = Colors.blue.shade900
      ..strokeWidth = 2;

    double spacing = size.width / (stressData.length - 1);

    Path stressPath = Path();
    Path relaxPath = Path();
    Path calmPath = Path();
    Path hrPath = Path();

    stressPath.moveTo(0, size.height - stressData[0]);
    relaxPath.moveTo(0, size.height - relaxData[0]);
    calmPath.moveTo(0, size.height - calmData[0]);
    hrPath.moveTo(0, size.height - hrData[0]);

    for (int i = 1; i < stressData.length; i++) {
      stressPath.lineTo(i * spacing, size.height - stressData[i]);
      relaxPath.lineTo(i * spacing, size.height - relaxData[i]);
      calmPath.lineTo(i * spacing, size.height - calmData[i]);
      hrPath.lineTo(i * spacing, size.height - hrData[i]);
    }

    Path relaxAreaPath = Path.from(relaxPath);
    relaxAreaPath.lineTo(size.width, size.height);
    relaxAreaPath.lineTo(0, size.height);
    relaxAreaPath.close();

    Path calmAreaPath = Path.from(calmPath);
    calmAreaPath.lineTo(size.width, size.height);
    calmAreaPath.lineTo(0, size.height);
    calmAreaPath.close();

    canvas.drawPath(calmAreaPath, calmPaint);
    canvas.drawPath(relaxAreaPath, relaxPaint);
    canvas.drawPath(hrPath, hrPaint);
    canvas.drawPath(stressPath, stressPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
