import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0, bottom: 0.0), 
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFFB57EDC), // light lavender
              Color(0xFF957DAD), // darker lavender
            ],
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.all(1),
        child: FloatingActionButton.extended(
          onPressed: () {},
          label: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              "New Invoice",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                fontFamily: 'RobotoFlex',
              ),
            ),
          ),
          icon: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Image.asset(
              'assets/image/floatbutton.png',
              height: 20,
              width: 20,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
    );
  }
}


