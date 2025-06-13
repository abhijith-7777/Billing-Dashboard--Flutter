import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  const Bar({super.key});

  @override
  Widget build(BuildContext context) {
    final TabController? controller = DefaultTabController.of(context);

    return Container(
      color: const Color(0xFF1F0D19),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildTab('All Invoices', isSelected: controller?.index == 0, context: context),
          buildTab('Paid', isSelected: controller?.index == 1, context: context),
          buildTab('Unpaid', isSelected: controller?.index == 2, context: context),
          buildTab('Drafts', isSelected: controller?.index == 3, context: context),
          buildIconTab(),
        ],
      ),
    );
  }

  Widget buildTab(String title, {required bool isSelected, required BuildContext context}) {
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          minimumSize: const Size(0, 0),
        ),
        onPressed: () {
          DefaultTabController.of(context).animateTo(_getTabIndex(title));
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


