import 'package:flutter/material.dart';

class SortSheetDemo extends StatelessWidget {
  const SortSheetDemo({super.key});

  void _showSortBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF141414),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => const SortBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text('Sort'),
        backgroundColor: const Color(0xFF121212),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showSortBottomSheet(context),
          child: const Text('Open Sort Sheet'),
        ),
      ),
    );
  }
}

class SortBottomSheet extends StatefulWidget {
  const SortBottomSheet({super.key});

  @override
  State<SortBottomSheet> createState() => _SortBottomSheetState();
}

class _SortBottomSheetState extends State<SortBottomSheet>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  final List<Map<String, dynamic>> options = [
    {'icon': Icons.swap_vert, 'label': 'Newest to Oldest', 'selected': true},
    {'icon': Icons.swap_vert, 'label': 'Oldest to Newest', 'selected': false},
    {'icon': Icons.sort_by_alpha, 'label': 'A to Z', 'selected': false},
    {'icon': Icons.sort_by_alpha, 'label': 'Z to A', 'selected': false},
  ];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[700],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          Column(
            children: List.generate(options.length, (index) {
              final animation =
                  Tween<Offset>(
                    begin: const Offset(0, 0.5),
                    end: Offset.zero,
                  ).animate(
                    CurvedAnimation(
                      parent: _controller,
                      curve: Interval(
                        index / options.length, // start delay
                        1.0,
                        curve: Curves.easeOut,
                      ),
                    ),
                  );

              return SlideTransition(
                position: animation,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF1C1C1E),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 18,
                        backgroundColor: const Color(0xFF2C2C2E),
                        child: Icon(
                          options[index]['icon'],
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        options[index]['label'],
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: options[index]['selected']
                          ? const Icon(Icons.check_circle, color: Colors.purple)
                          : null,
                      onTap: () {
                        Navigator.pop(context, options[index]['label']);
                      },
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
