import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  final TabController controller;

  const Bar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1F0D19),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildTab('All Invoices', isSelected: controller.index == 0),
          buildTab('Paid', isSelected: controller.index == 1),
          buildTab('Unpaid', isSelected: controller.index == 2),
          buildTab('Drafts', isSelected: controller.index == 3),
          buildIconTab(),
        ],
      ),
    );
  }

  Widget buildTab(String title, {required bool isSelected}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: isSelected
              ? const Color(0xFF6E5773)
              : Colors.transparent,
          side: const BorderSide(color: Color(0xFFB189BA)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          minimumSize: const Size(0, 0),
        ),
        onPressed: () {
          controller.animateTo(_getTabIndex(title));
        },
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFFB189BA),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget buildIconTab() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xFFB189BA)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
          minimumSize: const Size(0, 0),
        ),
        onPressed: () {},
        child: Image.asset('assets/image/Group.png', height: 18, width: 18),
      ),
    );
  }

  int _getTabIndex(String title) {
    switch (title) {
      case 'Paid':
        return 1;
      case 'Unpaid':
        return 2;
      case 'Drafts':
        return 3;
      default:
        return 0;
    }
  }
}
