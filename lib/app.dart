import 'package:flutter/material.dart';
import './widget/dashboard.dart';

final ValueNotifier<int> selectedSortIndex = ValueNotifier<int>(0);

class InvoiceApp extends StatelessWidget {
  const InvoiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const InvoiceDashboard(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.transparent,
      ),
    );
  }
}
