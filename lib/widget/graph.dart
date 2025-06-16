import 'package:flutter/material.dart';
import 'dart:math';

class CustomGauge extends StatelessWidget {
  const CustomGauge({super.key});

  Widget _buildStatusLegend(
    Color color,
    String text, {
    EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 10.0),
  }) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          Container(width: 18, height: 18, color: color),
          Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        children: [
          Center(
            child: SizedBox(
              width: 300,
              height: 100,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomPaint(
                    size: const Size(300, 100),
                    painter: GaugePainter(),
                  ),
                  Positioned(
                    top: 35,
                    child: Column(
                      children: const [
                        Text(
                          "50%",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Paid",
                          style: TextStyle(color: Colors.white70, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const Padding(padding: EdgeInsets.only(top: 50)),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildStatusLegend(Color(0XFFC27605), "Drafts (01)"),
              _buildStatusLegend(Color(0xFF4B7C47), "Paid (02)"),
              _buildStatusLegend(Color(0XFFFF373B), "Unpaid (01)"),
            ],
          ),
        ],
      ),
    );
  }
}

class GaugePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = 16.0;
    final arcWidth = 220.0;
    final cornerRadius = 4.0;

    final rect = Rect.fromLTWH(
      (size.width - arcWidth) / 2,
      15,
      arcWidth,
      size.height * 2,
    );

    final startAngle = pi;
    final totalAngle = pi;
    final gapAngle = 0.2;
    final segmentCount = 3;
    final totalGapAngle = gapAngle * (segmentCount - 1);

    final availableAngle = totalAngle - totalGapAngle;
    final sweepAngles = [
      availableAngle * 0.2, // 20%
      availableAngle * 0.5, // 50%
      availableAngle * 0.3, // 30%
    ];

    final colors = [Color(0xFFC27605), Color(0xFF4B7C47), Color(0xFFFF373B)];

    double currentAngle = startAngle;

    for (int i = 0; i < segmentCount; i++) {
      final paint = Paint()
        ..color = colors[i]
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;

      final roundedClip = RRect.fromRectAndRadius(
        rect.inflate(strokeWidth / 2),
        Radius.circular(cornerRadius),
      );

      canvas.save();
      canvas.clipRRect(roundedClip);
      canvas.drawArc(rect, currentAngle, sweepAngles[i], false, paint);
      canvas.restore();

      currentAngle += sweepAngles[i] + gapAngle;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
