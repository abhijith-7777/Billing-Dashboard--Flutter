import 'package:flutter/material.dart';

class Invoice extends StatelessWidget {
  const Invoice({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(right: 8, top: 20, bottom: 20),
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "Total Invoices: ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: "04",
                      style: TextStyle(
                        color: Color(0XFFD67252),
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(1, 20),
              side: const BorderSide(color: Color(0xFFA9A9A9)),
              shape: const StadiumBorder(),
              backgroundColor: const Color(0xFFA9A9A9).withOpacity(0.15),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 6),
                  child: Text(
                    "Payment History",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Image.asset(
                  'assets/image/download.png',
                  width: 16,
                  height: 16,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


