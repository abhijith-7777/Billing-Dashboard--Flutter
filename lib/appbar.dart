import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmall = screenWidth < 400;
    final isLarge = screenWidth > 600;

    return AppBar(
      backgroundColor: const Color(0xff228111e),
      title: Text(
        "Collect",
        style: TextStyle(
          color: Colors.white,
          fontSize: isLarge ? 22 : isSmall ? 16 : 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            'assets/image/logo.png',
            height: isLarge ? 28 : isSmall ? 20 : 24,
            width: isLarge ? 28 : isSmall ? 20 : 24,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            'assets/image/arrow.png',
            height: isLarge ? 28 : isSmall ? 20 : 24,
            width: isLarge ? 28 : isSmall ? 20 : 24,
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

