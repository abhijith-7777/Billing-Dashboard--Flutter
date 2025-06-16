import 'package:flutter/material.dart';

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
    'id': 'INVCC-000002',
    'date': '02/05/2025',
    'status': 'DRAFT',
    'amount': '₹2000.00',
    'color': Colors.orange,
    'icon': Icons.info,
  },
  {
    'name': 'Rahul V Nair',
    'id': 'INVCC-000001',
    'date': '02/05/2025',
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

Widget buildInvoiceCard(BuildContext context, Map<String, dynamic> invoice) {
  return Container(
    // Outer Container for the gradient border
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
      margin: EdgeInsets.all(1.0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 12, 14, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: Row(
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
                    onPressed: () {},
                    visualDensity: VisualDensity.compact,
                    splashRadius: 20,
                  ),
                ],
              ),
            ),

            // ID, Date, Status Row
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
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
            ),

            // Checkbox and Amount
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (_) {},
                        visualDensity: VisualDensity.compact,
                        side: const BorderSide(
                          color: Color(0xFFD67252),
                          width: 2,
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 0),
                          child: Text(
                            "Mark as paid by client",
                            style: const TextStyle(
                              fontSize: 11.5,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
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
