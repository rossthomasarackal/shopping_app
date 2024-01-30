import 'package:flutter/material.dart';

class Items extends StatelessWidget {
  Items({
    super.key,
    required this.category,
  });
  final String category;

  final List<String> electronicsProducts = [
    'assets/images/headphone.png',
    'assets/images/redheadset.png',
  ];

  final List<String> cosmeticsProducts = [
    'assets/images/girl.png',
    'assets/images/lipstick.png',
    'assets/images/lipstik.png',
  ];

  // Map<String, int> map = {
  //   'num1': 1,
  // };

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(136, 243, 188, 188),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text(
              category,
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (category == 'Electronix')
            GridView.builder(
              shrinkWrap: true,
              itemCount: electronicsProducts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                childAspectRatio: 4 / 3,
              ),
              itemBuilder: (ctx, idx) {
                return Image.asset(
                  electronicsProducts[idx],
                );
              },
            ),
          if (category == 'Cosmetix')
            GridView.builder(
              shrinkWrap: true,
              itemCount: cosmeticsProducts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                childAspectRatio: 4 / 3,
              ),
              itemBuilder: (ctx, idx) {
                return Image.asset(
                  cosmeticsProducts[idx],
                );
              },
            ),
        ],
      ),
    );
  }
}

class CustomGrid extends StatelessWidget {
  const CustomGrid({super.key, required this.iModel});
  final ItemModel iModel;
  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      width: 200,
      child: ClipRRect(
        child: Material(
          color: const Color.fromARGB(255, 255, 255, 255),
          child: InkWell(
            onTap: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (ctx) => SecondScreen(
              //         product: gModel.product,
              //         productName: gModel.productName,
              //         productPrice: gModel.productPrice),
              //   ),
              // );
              //print(gModel.productName);
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    iModel.product,
                    width: 150,
                    height: 150,
                  ),
                  Text(
                    iModel.productName,
                    style: const TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    iModel.productPrice,
                    style: const TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ItemModel {
  ItemModel(
      {required this.product,
      required this.productName,
      required this.productPrice});
  final String product;
  final String productName;
  final String productPrice;
}
