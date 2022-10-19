import 'package:flutter/material.dart';

import '../../../common/widgets/Star.dart';
import '../../../constants/GlobalVariables.dart';


class homeCard extends StatelessWidget {
  final String title;
  final String imgPath;
  final double price;
  final VoidCallback onTap;

  final double star;

  const homeCard({Key? key,
    required this.title,
    required this.imgPath,
    required this.price,
    required this.star, required this.onTap,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Container(

              width: double.infinity,

              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Container(
                      width: 130.0,
                      height: 130.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(

                              image: NetworkImage( imgPath),
                              fit: BoxFit.cover)),
                    ),

                    const SizedBox(width: 20.0),
                    Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        Row(

                          children: <Widget>[
                            Text(
                              title,
                              style: const TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),

                        const SizedBox(height: 5.0),
                        const SizedBox(width: 35.0),
                        Stars(
                          rating: star,
                        ),
                        Text(
                          '\N${price}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                        ),

                        const Text(
                          'In Stock',
                          style: TextStyle(
                            color: Colors.teal,
                          ),
                          maxLines: 2,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),


      ],
    );
  }
}




