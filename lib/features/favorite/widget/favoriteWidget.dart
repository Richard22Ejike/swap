
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/widgets/recommendeditems.dart';
import '../../../models/product.dart';
import '../../../providers/user_providers.dart';
import '../../Cart/services/cartServices.dart';
import '../../Product/screens/productScreen.dart';
import '../../Product/services/productDetailsServices.dart';


class FavoriteProduct extends StatefulWidget {
  final int index;
  const FavoriteProduct({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<FavoriteProduct> createState() => _FavoriteProductState();
}

class _FavoriteProductState extends State<FavoriteProduct> {
  final ProductDetailsServices productDetailsServices =
  ProductDetailsServices();

  final CartServices cartServices = CartServices();

  void increaseQuantity(Product product) {
    productDetailsServices.addToCart(
      context: context,
      product: product,
    );
  }

  void decreaseQuantity(Product product) {
    cartServices.removeFromCart(
      context: context,
      product: product,
    );
  }



  @override
  Widget build(BuildContext context) {
    final productFavorite = context.watch<UserProvider>().user.favorite[widget.index];
    final product = Product.fromMap(productFavorite['product']);
    double totalRating = 0;
    for (int i = 0; i < product.rating!.length; i++) {
      totalRating += product.rating![i].rating;
    }
    double avgRating = 0;
    if (totalRating != 0) {
      avgRating = totalRating / product.rating!.length;
    }


    return  GestureDetector(
      onTap: () {  Navigator.pushNamed(
          context,
          ProductScreen.routeName,
          arguments: product);
      },
      child: RecommendedItems(
        height: 270.0,
        radius: 8.0,
        top: 4.0,
        bottom: 4.0,
        left: 6.0,
        right: 6.0,
        image:  product.images[0],
        title: product.name,
        price: product.price, rating:avgRating,


      ),
    );
  }
}