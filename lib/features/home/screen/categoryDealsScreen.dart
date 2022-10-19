
import 'package:flutter/material.dart';
import '../../../common/widgets/loader.dart';
import '../../../common/widgets/recommendedView.dart';
import '../../../common/widgets/recommendeditems.dart';
import '../../../constants/globalVariables.dart';
import '../../../models/product.dart';
import '../../Product/screens/productScreen.dart';
import '../services/homeServices.dart';
import '../widgets/HomeCard.dart';

class CategoryDealsScreen extends StatefulWidget {
  static const String routeName = '/category-deals';
  final String category;
  const CategoryDealsScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<CategoryDealsScreen> createState() => _CategoryDealsScreenState();
}

class _CategoryDealsScreenState extends State<CategoryDealsScreen> {
  List<Product>? productList;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchCategoryProducts();
  }

  fetchCategoryProducts() async {
    productList = await homeServices.fetchCategoryProducts(
      context: context,
      category: widget.category,
    );
    setState(() {});
  }
 bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Text(
            widget.category,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: productList == null
          ? const Loader()
          : Column(
           children: [
            Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            alignment: Alignment.topLeft,
            child: Text(
              'Keep shopping for ${widget.category}',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
             SizedBox(
               height: 690,
               child: RecommendedView(
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
               ),
             )

           ],
      ),
    );
  }
}