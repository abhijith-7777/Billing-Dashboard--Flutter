import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFB57EDC), // light lavender
            Color(0xFF957DAD), // darker lavender
          ],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.all(1), // 1px gradient border
      child: FloatingActionButton.extended(
        onPressed: () {
         
        },
        label: Text(
          "New Invoice",
          style: TextStyle(
            fontSize: screenWidth * 0.035, 
            fontWeight: FontWeight.w600,
            fontFamily: 'RobotoFlex',
          ),
        ),
        icon: Image.asset(
          'assets/image/floatbutton.png', 
          height: screenWidth * 0.055, 
          width: screenWidth * 0.055,
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }
}

