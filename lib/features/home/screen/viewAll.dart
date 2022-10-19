import 'package:flutter/material.dart';

import '../../../common/widgets/Loader.dart';
import '../../../common/widgets/categoryview.dart';
import '../../../common/widgets/cateogoryitem.dart';
import '../../../common/widgets/pageappbar.dart';
import '../../../common/widgets/recommendedView.dart';
import '../../../common/widgets/recommendeditems.dart';
import '../../../constants/GlobalVariables.dart';
import '../../../models/product.dart';
import '../../Product/screens/productScreen.dart';
import '../services/homeServices.dart';
import 'categoryDealsScreen.dart';

class ViewAll extends StatefulWidget {

  const ViewAll({Key? key, }) : super(key: key);


  @override
  State<ViewAll> createState() => _ViewAllState();
}

class _ViewAllState extends State<ViewAll> {
  void navigateToCategoryPage(BuildContext context, String category) {
    Navigator.pushNamed(context, CategoryDealsScreen.routeName,
        arguments: category);
  }
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
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: const DefaultAppBar(
        title: "Recommended" ,

      ),
      body: productList == null
          ? const Loader()
          : RecommendedView(
                  direction: Axis.vertical,
                  heights: MediaQuery.of(context).size.height,
                  widths: MediaQuery.of(context).size.width,
                  top: 0.0,
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  column: 2,
                  ratio: 0.54,
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
                      top: 4.0,
                      bottom: 4.0,
                      left: 6.0,
                      right: 6.0,
                      image:  product.images[0],
                      title: product.name,
                      price: product.price,
                      rating: avgRating,

                    ),
          );
        },
      )

    );
  }
}
