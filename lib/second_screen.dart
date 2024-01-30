import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen(
      {super.key,
      required this.product,
      required this.productName,
      required this.productPrice});
  final String product;
  final String productName;
  final String productPrice;
  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(74, 17, 95, 185),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(productName,
              style: const TextStyle(
                  fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Image.asset(product, height: 400, width: 400),
            Text(productPrice,
              style: const TextStyle(
                  fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
