import 'package:flutter/material.dart';
import './bottomsheet.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final void Function(int)? onSortSelected;
  final int selectedSortIndex;

  const CustomAppBar({
    super.key,
    this.onSortSelected,
    this.selectedSortIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color(0xFF28111E),
      title: const Padding(
        padding: EdgeInsets.only(left: 0.0),
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
        IconButton(
          onPressed: () {},
          icon: Image.asset('assets/image/logo.png', height: 24, width: 24),
        ),
        IconButton(
          onPressed: () {
            _showSortBottomSheet(context);
          },
          icon: Image.asset('assets/image/arrow.png', height: 24, width: 24),
        ),
      ],
    );
  }

  void _showSortBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => AnimatedSortBottomSheet(
        selectedIndex: selectedSortIndex,
        onSelect: (index) {
          Navigator.pop(context);
          if (onSortSelected != null) {
            onSortSelected!(index);
          }
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
