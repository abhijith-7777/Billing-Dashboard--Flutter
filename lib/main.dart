import 'package:flutter/material.dart';
import 'widget/menubar.dart';
import 'widget/graph.dart';
import 'widget/total_payment_invoice.dart';
import 'widget/invoice_data.dart';
import './widget/bottomnav.dart';
import './widget/floatbutton.dart';
import './widget/appbar.dart';

void main() => runApp(InvoiceApp());

class InvoiceApp extends StatelessWidget {
  const InvoiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InvoiceDashboard(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.transparent,
      ),
    );
  }
}

class InvoiceDashboard extends StatelessWidget {
  const InvoiceDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Column(
          children: [
            const CustomAppBar(),
            const Bar(),
            const CustomGauge(),
            const Invoice(),

            Container(
              margin: const EdgeInsets.symmetric(vertical: 3),
              width: double.infinity,
              height: 0.4,
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

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ListView.builder(
                  itemCount: invoices.length,
                  itemBuilder: (context, index) =>
                      buildInvoiceCard(context, invoices[index]),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: const Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: CustomFloatingActionButton(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        bottomNavigationBar: CustomBottomNavigationBar(),
      ),
    );
  }
}
