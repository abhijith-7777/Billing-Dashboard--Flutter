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

class InvoiceDashboard extends StatefulWidget {
  const InvoiceDashboard({super.key});

  @override
  _InvoiceDashboardState createState() => _InvoiceDashboardState();
}

class _InvoiceDashboardState extends State<InvoiceDashboard>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          Bar(controller: _tabController),
         
          CustomGauge(),
          Invoice(),
          Container(
            margin: const EdgeInsets.symmetric(vertical:3),
            width: double.infinity,
            height: 0.4,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0x80767174), // 50% opacity
                  Color(0x80DCD2D8), // 50% opacity
                  Color(0x80767174), // 50% opacity
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
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.015,
        ),
        child: const CustomFloatingActionButton(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
