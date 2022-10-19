
import 'package:flutter/material.dart';


import '../../../common/widgets/Star.dart';
import '../../../common/widgets/recommendeditems.dart';
import '../../../models/product.dart';

class SearchedProduct extends StatelessWidget {
  final Product product;
  const SearchedProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalRating = 0;
    for (int i = 0; i < product.rating!.length; i++) {
      totalRating += product.rating![i].rating;
    }
    double avgRating = 0;
    if (totalRating != 0) {
      avgRating = totalRating / product.rating!.length;
    }
    return RecommendedItems(
      height: 100.0,
      radius: 8.0,
      top: 4.0,
      bottom: 4.0,
      left: 6.0,
      right: 6.0,
      image:  product.images[0],
      title: product.name,
      price: product.price,
      rating: avgRating,

    );

  }
}