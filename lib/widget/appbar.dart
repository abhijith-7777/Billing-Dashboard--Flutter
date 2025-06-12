import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0, 
      backgroundColor: const Color(0xff228111e),
      title: const Padding(
        padding: EdgeInsets.only(left: 16.0),
        child: Text(
          "Collect",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18, 
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/image/logo.png',
              height: 24,
              width: 24,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/image/arrow.png',
              height: 24,
              width: 24,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


