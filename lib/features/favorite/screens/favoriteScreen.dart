import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swap/features/favorite/widget/favoriteWidget.dart';

import '../../../common/widgets/recommendedView.dart';
import '../../../models/product.dart';
import '../../../providers/user_providers.dart';
import '../../Product/screens/productScreen.dart';
import '../../address/screens/adddressScreen.dart';
import '../../home/widgets/HomeCard.dart';

class FavouriteScreen extends StatefulWidget {
  static const String routeName = '/favorite';
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

  void navigateToAddress(int sum) {
    Navigator.pushNamed(
      context,
      AddressScreen.routeName,
      arguments: sum.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    int sum = 0;
    final user = context.watch<UserProvider>().user;
    user.cart
        .map((e) => sum +=  e['product']['price'] as int)
        .toList();

   return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [


            const SizedBox(height: 15),
            Container(
              color: Colors.black12.withOpacity(0.08),
              height: 1,
            ),
            const SizedBox(height: 5),

            RecommendedView(
              direction: Axis.vertical,
              heights: MediaQuery.of(context).size.height,
              widths: MediaQuery.of(context).size.width,
              top: 0.0,
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              column: 2,
              ratio: 0.54,
              items: user.favorite.length,
              itemBuilder: (context, index) {
                return  FavoriteProduct(
                  index: index,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
