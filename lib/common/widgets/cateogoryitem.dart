import 'package:flutter/material.dart';


class CategoryItems extends StatelessWidget {
  final double height;
  final double width;
  final double radius;
  final double  titleSize;
  final double  amountSize;
  final double   paddingHorizontal;
  final double    paddingVertical;
  final String image;
    final String  title;
        final String amount;
  final Color color;
  final Color lblColor;
  final align, blendMode;
  const CategoryItems({
    Key ? key,
    required this.height,
    required this.width,
    required this.radius,
     required this.titleSize ,
    required this.image,
    required this.title,
    required this.color,
    this.align,
    required this.amount,
    required this.lblColor,
    this.blendMode,
     this.amountSize = 0,
    required this.paddingHorizontal,
    required this.paddingVertical,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Stack(
        children: [
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(color, blendMode),
              ),
            ),
          ),
          Align(
            alignment: align,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: title,
                    style: TextStyle(color: Colors.white, fontSize: titleSize),
                  ),
                  WidgetSpan(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: paddingHorizontal,
                        vertical: paddingVertical,
                      ),
                      decoration: BoxDecoration(
                        color: lblColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                        ),
                      ),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: amount,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: amountSize,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
