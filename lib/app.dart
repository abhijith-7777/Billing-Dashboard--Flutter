import 'package:flutter/material.dart';
import 'widget/menubar.dart';
import 'widget/graph.dart';
import 'widget/total_payment_invoice.dart';
import 'widget/invoice_data.dart';
import './widget/bottomnav.dart';
import './widget/floatbutton.dart';
import './widget/appbar.dart';


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
      default:
        return invoices;
    }
  }

  @override
  Widget build(BuildContext context) {
    final allInvoices = invoices;

    return DefaultTabController(
      length: 4,
      child: Builder(
        builder: (context) {
          final controller = DefaultTabController.of(context);
          final currentIndex = controller.index;
          final filteredInvoices = getFilteredInvoices(
            allInvoices,
            currentIndex,
          );

          controller.addListener(() {
            (context as Element).markNeedsBuild();
          });

          return Scaffold(
            appBar: CustomAppBar(),

            body: Column(
              children: [
                Bar(controller: controller),
                if (currentIndex == 0) const CustomGauge(),
                const Invoice(),
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
                Padding(padding: const EdgeInsets.all(15)),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    child: ListView.builder(
                      itemCount: filteredInvoices.length,
                      itemBuilder: (context, index) =>
                          buildInvoiceCard(context, filteredInvoices[index]),
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
      ),
    );
  }
}
