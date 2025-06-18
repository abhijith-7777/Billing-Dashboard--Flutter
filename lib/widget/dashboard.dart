import 'package:flutter/material.dart';
import 'menubar.dart';
import 'graph.dart';
import 'total_payment_invoice.dart';
import 'invoice_data.dart';
import 'bottomnav.dart';
import 'floatbutton.dart';
import 'appbar.dart';

final ValueNotifier<int> selectedSortIndex = ValueNotifier<int>(0);

class InvoiceDashboard extends StatelessWidget {
  const InvoiceDashboard({super.key});

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
                    if (currentIndex == 0 && sorted.isNotEmpty)
                      CustomGauge(invoices: sorted),
                    Invoice(
                      currentIndex: currentIndex,
                      count: filtered.length,
                      showButton: sorted.isNotEmpty,
                    ),

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
                      child: sorted.isNotEmpty
                          ? ListView.builder(
                              itemCount: sorted.length,
                              itemBuilder: (context, index) =>
                                  buildInvoiceCard(context, sorted[index], () {
                                    selectedSortIndex.value =
                                        selectedSortIndex.value;
                                  }),
                            )
                          : Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/image/addinvoice.png',
                                      width: 45,
                                      height: 50,
                                      color: Colors.white,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 12),
                                      child: Text(
                                        "Add a new invoice to keep your billing organized",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 24),
                                      child: CustomFloatingActionButton(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
                floatingActionButton: sorted.isNotEmpty
                    ? const Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: CustomFloatingActionButton(),
                      )
                    : null,
                floatingActionButtonLocation: sorted.isNotEmpty
                    ? FloatingActionButtonLocation.centerFloat
                    : null,
                bottomNavigationBar: const CustomBottomNavigationBar(),
              );
            },
          );
        },
      ),
    );
  }
}
