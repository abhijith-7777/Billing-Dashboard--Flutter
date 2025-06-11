import 'package:flutter/material.dart';
import 'dart:math';

class CustomGauge extends StatelessWidget {
  const CustomGauge({super.key});

  Widget _buildStatusLegend(Color color, String text, {EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 8.0)}) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.zero,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 11, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
    
      child: Column(
        children: [
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: Size(350, 110),
                  painter: GaugePainter(),
                ),
                
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "50%",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  
                    Text(
                      "Paid",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildStatusLegend(Colors.orange[800]!,  "Drafts (01)"),
              _buildStatusLegend(Colors.green[600]!, "Paid (02)"),
              _buildStatusLegend(Colors.red[400]!, "Unpaid (01)"),
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
    final rect = Rect.fromLTWH(
      (size.width - 200) / 2,
      12,
      200,
      size.height * 2.0,
    );
    final startAngle = pi;
    final sweepAngles = [pi * 0.2, pi * 0.5, pi * 0.3];
    final colors = [Colors.orange[800]!, Colors.green[600]!, Colors.red[400]!];
    final gapAngle = pi * 0.01; 

    double currentAngle = startAngle;
    for (int i = 0; i < sweepAngles.length; i++) {
      final paint = Paint()
        ..color = colors[i]
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.butt;

      canvas.drawArc(rect, currentAngle, sweepAngles[i], false, paint);
      currentAngle += sweepAngles[i] + gapAngle;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
