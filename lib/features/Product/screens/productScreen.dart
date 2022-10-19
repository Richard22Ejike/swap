

import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';


import '../../../common/widgets/custembutton.dart';
import '../../../constants/GlobalVariables.dart';
import '../../../models/product.dart';
import '../../../providers/user_providers.dart';
import '../../search/screens/search_screen.dart';
import '../services/productDetailsServices.dart';
import '../widgets/carusel slider.dart';

class ProductScreen extends StatefulWidget {
  static const String routeName = '/Product-Screen';
  final Product product;
  const ProductScreen({Key? key, 
  required this.product
  }) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductDetailsServices productDetailsServices =
  ProductDetailsServices();
  double avgRating = 0;
  double myRating = 0;


    @override
  void initState() {
    super.initState();
    double totalRating = 0;
    for (int i = 0; i < widget.product.rating!.length; i++) {
      totalRating += widget.product.rating![i].rating;
      if (widget.product.rating![i].userId ==
          Provider.of<UserProvider>(context, listen: false).user.id) {
        myRating = widget.product.rating![i].rating;
      }
    }

    if (totalRating != 0) {
      avgRating = totalRating / widget.product.rating!.length;
    }

  }

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }


  void addToCart() {
    productDetailsServices.addToCart(
      context: context,
      product: widget.product,
    );
  }
  void addToFavorite() {
    productDetailsServices.addToFavorite(
      context: context,
      product: widget.product,
    );
  }
  void removeFromFavorite() {
    productDetailsServices.removeFromFavorite(
      context: context,
      product: widget.product,
    );
  }
  int selectedImage = 0;




  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
              SizedBox(height: 10,),
                Stack(
                  children: <Widget>[

                    CarouselSlider(
                      items: widget.product.images.map(
                            (i) {
                          return Builder(
                            builder: (BuildContext context) => Image.network(
                              i,
                              fit: BoxFit.contain,
                              height: 200,
                            ),
                          );
                        },
                      ).toList(),
                      options: CarouselOptions(
                        viewportFraction: 1,
                        height: 300,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                              icon: const Icon(Icons.arrow_back),
                              color: Colors.black,
                              onPressed:(){ Navigator.pop(context);}),

                        ],
                      ),
                    ),

                  ],
                ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(widget.product.images.length,
                        (index) => buildSmallProductPreview(index)),
              ],
            ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Product Id :  ${widget.product.id!}' ,
                    style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15.0,
                        color: Colors.grey
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
               Padding(
                  padding: EdgeInsets.only(left:15.0),
                  child: Text(widget.product.name,
                    style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 25.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: (MediaQuery.of(context).size.width / 4 + MediaQuery.of(context).size.width / 2) - 10.0,
                          child: Text(widget.product.description,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12.0,
                              color: Colors.grey.withOpacity(0.8),
                            ),
                          ),
                        ),
                               Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: RichText(
                                        text: TextSpan(
                                          text: 'Deal Price: ',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: '\$${widget.product.price}',
                                              style: const TextStyle(
                                                fontSize: 22,
                                                color: Colors.lightBlueAccent,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                              ],
                                            )
                ),
                const SizedBox(height: 20.0),
                const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10),
              child: CustomButton(
                text: 'Add to Cart',
                onTap: addToCart,
                color: GlobalVariables.primaryColor,
              ),
            ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: CustomButton(
                    text: 'Add to WishList',
                    onTap: addToFavorite,
                    color: GlobalVariables.primaryColor,
                  ),
                ),
            const SizedBox(height: 10),
            Container(
              color: Colors.black12,
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Rate This Product',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
                   RatingBar.builder(
                        initialRating: myRating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: GlobalVariables.secondaryColor,
              ),
                        onRatingUpdate: (rating) {
                          productDetailsServices.rateProduct(
                            context: context,
                            product: widget.product,
                            rating: rating,
                          );
              },
            )


              ],
            )



        );


  }

  buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: Duration(seconds: 4),
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: GlobalVariables.greyBackgroundCOlor.withOpacity(selectedImage == index ? 1 : 0)),
        ),
        child: Image.network(widget.product.images[index]),
      ),
    );
  }
}


