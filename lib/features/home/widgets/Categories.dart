
import 'package:flutter/material.dart';
import '../../../constants/globalVariables.dart';
import '../screen/categoryDealsScreen.dart';


class TopCategories extends StatelessWidget {
  const TopCategories({Key? key}) : super(key: key);

  void navigateToCategoryPage(BuildContext context, String category) {
    Navigator.pushNamed(context, CategoryDealsScreen.routeName,
        arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: GlobalVariables.backgroundColor,
      width: double.infinity,
      height: 400,
      child:
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
          height: 300.0,
          width: MediaQuery.of(context).size.width,
          color: kWhiteColor,
          child: GridView.builder(
              padding: const EdgeInsets.all(8),
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,

              ),
              itemCount: GlobalVariables.categoryImages.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () => navigateToCategoryPage(
                    context,
                    GlobalVariables.categoryImages[index]['title']!,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,

                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(GlobalVariables.categoryImages[index]['image']!,
                              fit: BoxFit.cover,
                              colorBlendMode: BlendMode.hardLight,
                              color: kDarkColor,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,

                          child: Text( GlobalVariables.categoryImages[index]['title']!,
                            style: const TextStyle(color: Colors.white, fontSize: 15),),

                        ),
                      ],
                    ),
                  ),




              );
            },),
        )


      ),
    );
  }
}