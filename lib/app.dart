import 'package:flutter/material.dart';
import 'widget/menubar.dart';
import 'widget/graph.dart';
import 'widget/total_payment_invoice.dart';
import 'widget/invoice_data.dart';
import './widget/bottomnav.dart';
import './widget/floatbutton.dart';
import './widget/appbar.dart';


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

class InvoiceDashboard extends StatelessWidget {
  const InvoiceDashboard({super.key});

  List<Map<String, dynamic>> getFilteredInvoices(
    List<Map<String, dynamic>> invoices,
    int index,
  ) {
    switch (index) {
      case 1:
        return invoices.where((i) => i['status'] == 'PAID').toList();
      case 2:
        return invoices.where((i) => i['status'] == 'UNPAID').toList();
      case 3:
        return invoices.where((i) => i['status'] == 'DRAFT').toList();
      case 4:
        return invoices
            .where((i) => selectedInvoiceIds.contains(i['id']))
            .toList();
      default:
        return invoices;
    }
  }

  List<Map<String, dynamic>> sortInvoices(
    List<Map<String, dynamic>> data,
    int sortIndex,
  ) {
    List<Map<String, dynamic>> sorted = [...data];
    DateTime parseDate(String dateStr) {
      final parts = dateStr.split('/');
      return DateTime(
        int.parse(parts[2]),
        int.parse(parts[1]),
        int.parse(parts[0]),
      );
    }

    switch (sortIndex) {
      case 0:
        sorted.sort(
          (a, b) => parseDate(b['date']).compareTo(parseDate(a['date'])),
        );
        break;
      case 1:
        sorted.sort(
          (a, b) => parseDate(a['date']).compareTo(parseDate(b['date'])),
        );
        break;
      case 2:
        sorted.sort((a, b) => a['name'].compareTo(b['name']));
        break;
      case 3:
        sorted.sort((a, b) => b['name'].compareTo(a['name']));
        break;
    }
    return sorted;
  }

  @override
  Widget build(BuildContext context) {
    final allInvoices = invoices;

    return DefaultTabController(
      length: 5,
      child: Builder(
        builder: (context) {
          final controller = DefaultTabController.of(context);

          return ValueListenableBuilder<int>(
            valueListenable: selectedSortIndex,
            builder: (context, sortIndex, _) {
              final currentIndex = controller.index;
              final filtered = getFilteredInvoices(allInvoices, currentIndex);
              final sorted = sortInvoices(filtered, sortIndex);

              controller.addListener(() {
                (context as Element).markNeedsBuild();
              });

              return Scaffold(
                appBar: CustomAppBar(
                  onSortSelected: (index) {
                    selectedSortIndex.value = index;
                  },
                  selectedSortIndex: sortIndex,
                ),
                body: Column(
                  children: [
                    Bar(controller: controller),
                    if (currentIndex == 0) CustomGauge(invoices: sorted),
                    Invoice(currentIndex: currentIndex, count: filtered.length),
                    Container(
                      width: double.infinity,
                      height: 0.5,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0x80767174),
                            Color(0x80DCD2D8),
                            Color(0x80767174),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          stops: [0.0, 0.5, 1.0],
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(15)),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0),
                        child: ListView.builder(
                          itemCount: sorted.length,
                          itemBuilder: (context, index) => buildInvoiceCard(
                            context,
                            sorted[index],
                            () => selectedSortIndex.notifyListeners(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                floatingActionButton: const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: CustomFloatingActionButton(),
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
                bottomNavigationBar: const CustomBottomNavigationBar(),
              );
            },
          );
        },
      ),
    );
  }
}

