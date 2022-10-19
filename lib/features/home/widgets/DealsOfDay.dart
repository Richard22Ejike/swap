
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swap/constants/GlobalVariables.dart';


import '../../../common/widgets/loader.dart';

import '../../../common/widgets/recommendedView.dart';
import '../../../common/widgets/recommendeditems.dart';
import '../../../models/product.dart';
import '../../../providers/user_providers.dart';
import '../../Product/screens/productScreen.dart';
import '../services/homeServices.dart';
import 'HomeCard.dart';


class DealsOfDay extends StatefulWidget {

  const DealsOfDay({Key? key, }) : super(key: key);

  @override
  State<DealsOfDay> createState() => _DealsOfDayState();
}

class _DealsOfDayState extends State<DealsOfDay> {

  List<Product>? productList;

  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchDealOfDay();
  }

  void fetchDealOfDay() async {
    productList = await homeServices.fetchDealsOfDay(context: context);
    setState(() {});
  }






  @override
  Widget build(BuildContext context) {


    return productList == null
        ? const Loader()
        : SizedBox( height: 400,


          child:
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                child:
                RecommendedView(
                  direction: Axis.horizontal,
                  heights: 315.0,
                  widths: MediaQuery.of(context).size.width,
                  top: 0.0,
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  column: 1,
                  ratio: 1.8,
                  items: productList!.length,
                  itemBuilder: (context, index) {
                    final product = productList![index];
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
                        top: 8.0,
                        bottom: 8.0,
                        left: 4.0,
                        right: 4.0,
                        image:  product.images[0],
                        title: product.name,
                        price: product.price,
                        rating: avgRating,

              ),
                    );
            },
          ),
        )
        );
  }
}