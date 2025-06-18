import 'package:flutter/material.dart';

class CustomSortBottomSheet extends StatelessWidget {
  final int selectedIndex;
  final void Function(int index)? onSelect;

  const CustomSortBottomSheet({
    super.key,
    this.selectedIndex = 0,
    this.onSelect,
  });

  final List<Map<String, dynamic>> sortOptions = const [
    {"icon": "assets/image/Download1.png", "text": "Download"},
    {"icon": "assets/image/reminder.png", "text": "Send payment reminder"},
    {"icon": "assets/image/share.png", "text": "Share"},
    {"icon": "assets/image/remove.png", "text": "Remove"},
  ];

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Offset>(
      tween: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      builder: (context, offset, child) {
        return SlideTransition(
          position: AlwaysStoppedAnimation(offset),
          child: child,
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: const BoxDecoration(
          color: Color(0xFF151515),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 50,
              height: 2,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5).withOpacity(0.5),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            ...List.generate(sortOptions.length, (index) {
              final item = sortOptions[index];
              return Column(
                children: [
                  ListTile(
                    leading: Image.asset(
                      item['icon'],
                      width: 40,
                      height: 40,
                      color: Colors.white,
                    ),
                    title: Text(
                      item['text'],
                      style: const TextStyle(
                        color: Color(0xFFEDE8EB),
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                 
                    onTap: () {
                      if (onSelect != null) onSelect!(index);
                    },
                  ),
                  if (index != sortOptions.length - 1)
                    Divider(
                      color: const Color(0xFFB4B4B4).withOpacity(0.2),
                      thickness: 0.4,
                    ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
