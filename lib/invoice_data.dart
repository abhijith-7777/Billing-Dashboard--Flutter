// invoice_card.dart

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
];

Widget buildInvoiceCard(BuildContext context, Map<String, dynamic> invoice) {
  final screenWidth = MediaQuery.of(context).size.width;
  final isSmall = screenWidth < 400;

  return Card(
    color: const Color(0x26D9D9D9), 

    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  invoice['name'],
                  style: TextStyle(
                    fontSize: isSmall ? 14 : 16,
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

          const SizedBox(height: 2),
// invoice id & date
          Row(
            children: [
              Flexible(
                child: Text(
                  '${invoice['id']}  ${invoice['date']}',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: isSmall ? 11 : 13,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                invoice['icon'],
                color: invoice['color'],
                size: isSmall ? 16 : 25,
              ),
              const SizedBox(width: 4),
              Text(
                invoice['status'],
                style: TextStyle(
                  color:
                      Color(0xFFA9A9A9),
                  fontSize: isSmall ? 11 : 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),

          const SizedBox(height: 2),

          // Checkbox & Amount
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
                      child: Text(
                        "Mark as paid by client",
                        style: TextStyle(
                          fontSize: isSmall ? 11 : 12,
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
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: isSmall ? 12 : 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
