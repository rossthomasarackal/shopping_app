import 'package:deros/second_screen.dart';
import 'package:flutter/material.dart';

class Grid extends StatelessWidget {
  Grid({super.key});
  final List<GridModel> modelGrid = [
    GridModel(
        product: 'assets/images/yellowbag.png',
        productName: 'Hand Bag',
        productPrice: 'Rs. 200'),
    // productDesc:
    GridModel(
        product: 'assets/images/laptop.png',
        productName: 'Laptop',
        productPrice: 'Rs. 300'),
    GridModel(
        product: 'assets/images/tableset.png',
        productName: 'Table set',
        productPrice: 'Rs. 2500'),
    GridModel(
        product: 'assets/images/dring.png',
        productName: 'Ring ',
        productPrice: 'Rs. 300'),
    GridModel(
        product: 'assets/images/chair.png',
        productName: 'Chair ',
        productPrice: 'Rs. 3000'),
  ];

  @override
  Widget build(context) {
    //  childAspectRatio: 5/2,
    //  crossAxisCount: 2,
    return SizedBox(
      height: 500,
      child: GridView.builder(
        shrinkWrap: true,
        primary: false,
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 400,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 30,
            mainAxisSpacing: 30),
        itemCount: modelGrid.length,
        itemBuilder: (BuildContext ctx, index) {
          return CustomGrid(gModel: modelGrid[index]);
        },
      ),
    );
  }
}

class CustomGrid extends StatelessWidget {
  const CustomGrid({super.key, required this.gModel});
  final GridModel gModel;
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
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => SecondScreen(
                      product: gModel.product,
                      productName: gModel.productName,
                      productPrice: gModel.productPrice),
                ),
              );
              //print(gModel.productName);
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    gModel.product,
                    width: 150,
                    height: 150,
                  ),
                  Text(
                    gModel.productName,
                    style: const TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    gModel.productPrice,
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

class GridModel {
  GridModel(
      {required this.product,
      required this.productName,
      required this.productPrice});
  final String product;
  final String productName;
  final String productPrice;
}
