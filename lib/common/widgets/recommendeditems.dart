import 'package:flutter/material.dart';
import '../../constants/GlobalVariables.dart';
import 'Star.dart';


class RecommendedItems extends StatelessWidget {
  final double height;
  final double    price;
  final double    rating;
  final double    top;
  final double    bottom;
  final double    left;
  final double    right;
  final double    radius;
  final String image, title;

  const RecommendedItems({
    Key ? key, required this.height, required this.price, required this.rating, required this.top, required this.bottom, required this.left, required this.right, required this.radius, required this.image, required this.title,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
      ),
      decoration: BoxDecoration(
        color: kAccentColor,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: kAccentColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height,

            child:       ClipRRect(    borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius),
              topRight: Radius.circular(radius),
            ),
              child: Image.network(
                image,
                fit: BoxFit.cover,

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              right: 5,
              left: 5,
            ),
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: kDarkColor.withOpacity(0.8),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 5,
              left: 5,
            ),
            child: Text("\$ ${price.toString()}"),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 5,
              left: 5,
            ),
            child:  Stars(
              rating: rating,
            ),
          ),
          Container(
            width: 235,
            padding: const EdgeInsets.only(left: 10, top: 5),
            child: const Text(
              'In Stock',
              style: TextStyle(
                color: Colors.teal,
              ),
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
