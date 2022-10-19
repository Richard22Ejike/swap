import 'package:flutter/material.dart';



import '../../../common/widgets/Loader.dart';
import '../../../common/widgets/pageappbar.dart';
import '../../../common/widgets/singleProduct.dart';
import '../../../models/swapproduct.dart';
import '../services/swapservices.dart';
import 'addScreen.dart';

class SwapScreen extends StatefulWidget {
  static const String routeName = '/swap';
  const SwapScreen({Key? key}) : super(key: key);

  @override
  State<SwapScreen> createState() => _SwapScreenState();
}

class _SwapScreenState extends State<SwapScreen> {
  List<SwapProduct>? swapproducts;
  final SwapServices swapservices = SwapServices();

  @override
  void initState() {
    super.initState();
    fetchAllSwapProducts();
  }

  fetchAllSwapProducts() async {
    swapproducts = await swapservices.fetchAllSwapProducts(context);
    setState(() {});
  }



  void navigateToAddProduct() {
    Navigator.pushNamed(context, AddScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const DefaultAppBar(
        title: "Swap",

      ),
      body: swapproducts == null
          ? const Loader()
          : Scaffold(
        body: GridView.builder(
          itemCount: swapproducts!.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            final productData = swapproducts![index];
            return Column(
              children: [
                SizedBox(
                  height: 140,
                  child: SingleProduct(
                    image: productData.images[0],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Text(
                        productData.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),

                  ],
                ),
              ],
            );
          },
        ),
            floatingActionButton: FloatingActionButton(
            onPressed: navigateToAddProduct,
            tooltip: 'Add a Product',
            child: const Icon(Icons.add),
              ),
      ),

      );



  }
}
