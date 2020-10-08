import 'package:flutter/material.dart';
import 'package:profile_screen/home/card_item.dart';

class HorizontalImageList extends StatefulWidget {
  @override
  _HorizontalImageListState createState() => _HorizontalImageListState();
}

class _HorizontalImageListState extends State<HorizontalImageList> {
  final images = [
    "img_1.png",
    "img_2.png",
    "img_3.png",
    "img_4.png",
    "img_5.png"
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.00,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          itemBuilder: (context, index) {
            final image = images[index];
            return CardItem(
              imageName: image,
              onTap: () => _onCardClicked(),
            );
          }),
    );
  }

  void _onCardClicked() {}
}
