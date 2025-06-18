
import 'package:flutter/material.dart';
import 'dart:math';

class CustomGauge extends StatelessWidget {
  final List<Map<String, dynamic>> invoices;

  const CustomGauge({super.key, required this.invoices});

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
    final draftCount = invoices.where((i) => i['status'] == 'DRAFT').length;
    final paidCount = invoices.where((i) => i['status'] == 'PAID').length;
    final unpaidCount = invoices.where((i) => i['status'] == 'UNPAID').length;

    final total = draftCount + paidCount + unpaidCount;

    final draftRatio = total == 0 ? 0.0 : draftCount / total;
    final paidRatio = total == 0 ? 0.0 : paidCount / total;
    final unpaidRatio = total == 0 ? 0.0 : unpaidCount / total;

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
                    painter: GaugePainter(
                      draftRatio: draftRatio,
                      paidRatio: paidRatio,
                      unpaidRatio: unpaidRatio,
                    ),
                  ),
                  Positioned(
                    top: 35,
                    child: Column(
                      children: [
                        Text(
                          "${(paidRatio * 100).toStringAsFixed(0)}%",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Text(
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
              _buildStatusLegend(
                const Color(0xFFC27605),
                "Drafts (${draftCount.toString().padLeft(2, '0')})",
              ),
              _buildStatusLegend(
                const Color(0xFF4B7C47),
                "Paid (${paidCount.toString().padLeft(2, '0')})",
              ),
              _buildStatusLegend(
                const Color(0xFFFF373B),
                "Unpaid (${unpaidCount.toString().padLeft(2, '0')})",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class GaugePainter extends CustomPainter {
  final double draftRatio;
  final double paidRatio;
  final double unpaidRatio;

  GaugePainter({
    required this.draftRatio,
    required this.paidRatio,
    required this.unpaidRatio,
  });

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
      availableAngle * draftRatio,
      availableAngle * paidRatio,
      availableAngle * unpaidRatio,
    ];

    final colors = [
      const Color(0xFFC27605), // Draft
      const Color(0xFF4B7C47), // Paid
      const Color(0xFFFF373B), // Unpaid
    ];

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
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}