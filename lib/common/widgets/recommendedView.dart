import 'package:flutter/material.dart';
import '../../constants/GlobalVariables.dart';

class RecommendedView extends StatelessWidget {
  final int column;
  final int items;
  final double ratio;
  final double    heights;
  final double    widths;
  final double    top;
  final double    bottom;
  final double    left;
  final double    right;
  final  direction, itemBuilder;
  const RecommendedView({
    Key ? key, required this.column, required this.items, required this.ratio, required this.heights, required this.widths, required this.top, required this.bottom, required this.left, required this.right, required this.direction, required this.itemBuilder,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heights,
      width: widths,
      color: kWhiteColor,
      margin: EdgeInsets.only(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
      ),
      child: GridView.builder(
        scrollDirection: direction,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: column,
          childAspectRatio: ratio,
          mainAxisSpacing: 0.0,
          crossAxisSpacing: 0.0,
        ),
        itemCount: items,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
