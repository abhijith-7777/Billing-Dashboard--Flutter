import 'package:flutter/material.dart';
import './bottomchoosesheet.dart';


final List<Map<String, dynamic>> invoices = [
  {
    'name': 'Rahul V Nair',
    'id': 'INVCC-000002',
    'date': '02/05/2025',
    'status': 'UNPAID',
    'amount': '₹2000.00',
    'color': Colors.red,
    'icon': Icons.error,
  },
  {
    'name': 'Ajith Simon',
    'id': 'INVCC-000004',
    'date': '02/05/2025',
    'status': 'DRAFT',
    'amount': '₹2000.00',
    'color': Colors.orange,
    'icon': Icons.info,
  },
  {
    'name': 'Rahul V Nair',
    'id': 'INVCC-000001',
    'date': '03/05/2025',
    'status': 'PAID',
    'amount': '₹2000.00',
    'color': Colors.green,
    'icon': Icons.check_circle,
  },
  {
    'name': 'Jesbin Binu',
    'id': 'INVCC-000003',
    'date': '02/05/2025',
    'status': 'PAID',
    'amount': '₹19000.00',
    'color': Colors.green,
    'icon': Icons.check_circle,
  },
];

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
      return invoices.where((i) => selectedInvoiceIds.contains(i['id'])).toList();
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


final Set<String> selectedInvoiceIds = {};

Widget buildInvoiceCard(
  BuildContext context,
  Map<String, dynamic> invoice,
  VoidCallback onUpdate,
) {
  final ValueNotifier<bool> isCheckedNotifier = ValueNotifier(
    selectedInvoiceIds.contains(invoice['id']),
  );

  return Container(
    margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      gradient: const LinearGradient(
        colors: [Color(0xFF50223C), Color(0xFF6D5074)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: Card(
      color: const Color.fromARGB(31, 0, 0, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.all(1.0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 12, 14, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row: Name and Options
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    invoice['name'],
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz, color: Colors.white),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      builder: (_) => CustomSortBottomSheet(
                        selectedIndex: 0,
                        onSelect: (int index) {
                          if (index == 3) {
                            // Remove selected invoice
                            invoices.removeWhere((element) =>
                                element['id'] == invoice['id']);
                            selectedInvoiceIds.remove(invoice['id']);
                            onUpdate();
                          }
                          Navigator.pop(context);
                        },
                      ),
                    );
                  },
                  visualDensity: VisualDensity.compact,
                  splashRadius: 20,
                ),
              ],
            ),

            // ID, Date, Status row
            Row(
              children: [
                Flexible(
                  child: Text(
                    '${invoice['id']}  ${invoice['date']}',
                    style: TextStyle(color: Colors.grey[400], fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6, right: 4),
                  child: Icon(
                    invoice['icon'],
                    color: invoice['color'],
                    size: 20,
                  ),
                ),
                Text(
                  invoice['status'],
                  style: const TextStyle(
                    color: Color(0xFFA9A9A9),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),

            // Checkbox and Amount
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Row(
                    children: [
                      ValueListenableBuilder<bool>(
                        valueListenable: isCheckedNotifier,
                        builder: (context, isChecked, _) {
                          return Checkbox(
                            value: isChecked,
                            onChanged: (bool? newValue) {
                              final newState = newValue ?? false;
                              isCheckedNotifier.value = newState;

                              if (newState) {
                                selectedInvoiceIds.add(invoice['id']);
                              } else {
                                selectedInvoiceIds.remove(invoice['id']);
                              }

                              onUpdate();
                            },
                            visualDensity: VisualDensity.compact,
                            side: const BorderSide(
                              color: Color(0xFFD67252),
                              width: 2,
                            ),
                            activeColor: Color(0xFFD67252),
                            checkColor: Colors.white,
                          );
                        },
                      ),
                      Flexible(
                        child: Text(
                          "Mark as paid by client",
                          style: const TextStyle(
                            fontSize: 11.5,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  invoice['amount'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
