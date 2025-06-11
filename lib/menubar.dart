import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  final TabController controller;

  const Bar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;

    return Container(
      color: const Color(0xFF1F0D19),
      
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            buildTab('All Invoices', isSelected: controller.index == 0, isSmallScreen: isSmallScreen),
            buildTab('Paid', isSelected: controller.index == 1, isSmallScreen: isSmallScreen),
            buildTab('Unpaid', isSelected: controller.index == 2, isSmallScreen: isSmallScreen),
            buildTab('Drafts', isSelected: controller.index == 3, isSmallScreen: isSmallScreen),
            buildIconTab(isSmallScreen: isSmallScreen),
          ],
        ),
      ),
    );
  }

  Widget buildTab(String title, {required bool isSelected, required bool isSmallScreen}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: isSelected ? const Color(0xFF6E5773) : Colors.transparent,
          side: const BorderSide(color: Color(0xFFB189BA)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: isSmallScreen ? 12 : 16,
            vertical: isSmallScreen ? 2 : 4,
          ),
          minimumSize: const Size(0, 25),
        ),
        onPressed: () {
          controller.animateTo(_getTabIndex(title));
        },
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFFB189BA),
            fontSize: isSmallScreen ? 11 : 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget buildIconTab({required bool isSmallScreen}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xFFB189BA)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: isSmallScreen ? 10 : 14,
            vertical: isSmallScreen ? 2 : 4,
          ),
          minimumSize: const Size(0, 25),
        ),
        onPressed: () {
         
        },
        child: Image.asset(
          'assets/image/Group.png',
          height: isSmallScreen ? 16 : 18,
          width: isSmallScreen ? 16 : 18,
        ),
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

