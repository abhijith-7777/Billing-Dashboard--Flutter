import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState
    extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final iconSize = screenWidth * 0.07; // 7% of screen width
    final textSize = screenWidth * 0.03; // 3% of screen width
    final indicatorWidth = screenWidth * 0.15; // ~15% of screen width (~57px on 375px width)
    final indicatorHeight = screenHeight * 0.0025; // ~2px on 800px height

    BottomNavigationBarItem buildItem(String asset, String label, int index) {
      return BottomNavigationBarItem(
        label: label,
        icon: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              asset,
              height: iconSize,
              width: iconSize,
            ),
            SizedBox(height: screenHeight * 0.005),
            Text(
              label,
              style: TextStyle(
                color: _currentIndex == index
                    ? const Color.fromARGB(255, 237, 235, 232)
                    : Colors.white70,
                fontSize: textSize,
              ),
            ),
            SizedBox(height: screenHeight * 0.005),
            if (_currentIndex == index)
              Container(
                width: indicatorWidth,
                height: indicatorHeight,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0x80FFA726),
                      Color(0x80FF9800),
                    ],
                  ),
                ),
              )
            else
              SizedBox(height: indicatorHeight),
          ],
        ),
      );
    }

    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 0,
      unselectedFontSize: 0,
      backgroundColor: const Color(0xFF1F0D19),
      items: [
        buildItem('assets/image/invoice.png', "Invoices", 0),
        buildItem('assets/image/clients.png', "Clients", 1),
        buildItem('assets/image/settings.png', "Settings", 2),
        buildItem('assets/image/exit.png', "Exit Collect", 3),
      ],
    );
  }
}



