import 'package:flutter/material.dart';

class Invoice extends StatelessWidget {
  const Invoice({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             
              Flexible(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Total Invoices: ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth < 400 ? 10 : 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: "04",
                        style: TextStyle(
                          color: Color(0XFFD67252),
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth < 400 ? 10 : 12,
                        ),
                      ),
                    ],
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              const SizedBox(width: 10),

             
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(1, 30),
                  side: const BorderSide(color: Color(0xFFA9A9A9)),
                  shape: const StadiumBorder(),
                  backgroundColor: Color(0xFFA9A9A9).withOpacity(0.15),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Payment History",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth < 400 ? 10 : 12,
                      ),
                    ),
                    const SizedBox(width: 5),
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
          );
        },
      ),
    );
  }
}
