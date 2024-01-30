import 'package:deros/l_items.dart';
import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  HorizontalList({super.key});

  final List<ModelWidget> modelList = [
    ModelWidget(image: 'assets/images/redheadset.png', text: 'Electronix'),
    ModelWidget(image: 'assets/images/lipstik.png', text: 'Cosmetix'),
    ModelWidget(image: 'assets/images/redfrock.png', text: 'women'),
    ModelWidget(image: 'assets/images/jacket.png', text: 'Men'),
    ModelWidget(image: 'assets/images/redplate.png', text: 'Food'),
    ModelWidget(image: 'assets/images/wine.png', text: 'Bevareges'),
    ModelWidget(image: 'assets/images/redshoe.png', text: 'Heels'),
    ModelWidget(image: 'assets/images/nike.png', text: 'Shoes'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 90,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: modelList.length,
          itemBuilder: (ctx, idx) {
            return CustomItemWidget(model: modelList[idx]);
          },
        ),
      ),
    );
  }
}

class CustomItemWidget extends StatelessWidget {
  const CustomItemWidget({super.key, required this.model});
  final ModelWidget model;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: ClipOval(
        child: Material(
          color: const Color.fromARGB(255, 255, 255, 255),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => Items(category: model.text),
                ),
              );
              print(model.text+ ' is selected ');
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    model.image,
                    width: 60,
                    height: 60,
                  ),
                  Text(
                    model.text,
                    style: const TextStyle(fontSize: 10, color: Colors.black),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ModelWidget {
  ModelWidget({required this.image, required this.text});
  final String image;
  final String text;
}
