import 'package:flutter/material.dart';


class Categoryview extends StatelessWidget {
  final int column, items;
  final  child;
  final Color color;
  final double ratio, height, width;
  final direction, itemBuilder;
  const Categoryview({
    Key ?key,

    this.direction,
    this.itemBuilder,
    required this.column,
    required this.items,
    this.child,
    required this.color,
    required this.ratio,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: color,
      child: GridView.builder(
          padding: EdgeInsets.all(8),
          scrollDirection: direction,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: column,
            childAspectRatio: ratio,
            mainAxisSpacing: 0.0,
            crossAxisSpacing: 0.0,
          ),
          itemCount: items,
          itemBuilder: itemBuilder),
    );
  }
}