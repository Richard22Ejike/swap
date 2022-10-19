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

class ViewAllCategory extends StatefulWidget {

  const ViewAllCategory({Key? key, }) : super(key: key);


  @override
  State<ViewAllCategory> createState() => _ViewAllCategoryState();
}

class _ViewAllCategoryState extends State<ViewAllCategory> {
  void navigateToCategoryPage(BuildContext context, String category) {
    Navigator.pushNamed(context, CategoryDealsScreen.routeName,
        arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhiteColor,
        appBar: const DefaultAppBar(
          title: "Category" ,

        ),
        body:         Categoryview(
                direction: Axis.vertical,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: kWhiteColor,
                column:  2,
                ratio:  1.3,
                items: GlobalVariables.categoryImages.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => navigateToCategoryPage(
                      context,
                      GlobalVariables.categoryImages[index]['title']!,
                    ),
                    child: CategoryItems(
                      height: 150.0,
                      width: MediaQuery.of(context).size.width,
                      paddingHorizontal: 0.0,
                      paddingVertical: 0.0,
                      align: Alignment.center,
                      radius: 8,
                      blendMode: BlendMode.difference,
                      color: kDarkColor,
                      image: GlobalVariables.categoryImages[index]['image']!,
                      title: GlobalVariables.categoryImages[index]['title']!,
                      titleSize: 20.0,
                      amount: "",
                      amountSize: 0.0, lblColor: Colors.transparent,
                    ),
                  );
      },
    ),

    );
  }
}
