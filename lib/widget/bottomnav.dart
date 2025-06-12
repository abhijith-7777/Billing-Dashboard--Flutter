import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  BottomNavigationBarItem buildItem(String asset, String label, bool isActive) {
    return BottomNavigationBarItem(
      label: '',
      icon: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Image.asset(asset, height: 24, width: 24),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                label,
                style: TextStyle(
                  color: isActive
                      ? const Color.fromARGB(255, 237, 235, 232)
                      : Colors.white70,
                  fontSize: 12,
                ),
              ),
            ),
            Container(
              width: 40,
              height: 2,
              decoration: BoxDecoration(
                gradient: isActive
                    ? const LinearGradient(
                        colors: [Color(0x80FFA726), Color(0x80FF9800)],
                      )
                    : const LinearGradient(
                        colors: [Colors.transparent, Colors.transparent],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const int currentIndex = 0;

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {},
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 0,
      unselectedFontSize: 0,
      backgroundColor: const Color(0xFF1F0D19),
      items: [
        buildItem('assets/image/invoice.png', "Invoices", currentIndex == 0),
        buildItem('assets/image/clients.png', "Clients", currentIndex == 1),
        buildItem('assets/image/settings.png', "Settings", currentIndex == 2),
        buildItem('assets/image/exit.png', "Exit Collect", currentIndex == 3),
      ],
    );
  }
}
