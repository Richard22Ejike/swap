

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:swap/constants/GlobalVariables.dart';
import 'package:swap/features/home/screen/viewAll.dart';
import 'package:swap/features/home/screen/viewallCategories.dart';
import 'package:swap/features/home/widgets/Categories.dart';
import 'package:swap/features/home/widgets/DealsOfDay.dart';

import '../../../common/widgets/label.dart';
import '../../search/screens/search_screen.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);
  void navigateToSearchScreen(String  query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (currentIndex < sliderImages.length) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }
      pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: GlobalVariables.greyBackgroundCOlor,

      body: ListView(
        children: <Widget>[
          Stack(
            children: [
              SizedBox(
                height: 250.0,
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  itemCount: sliderImages.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      sliderImages[index],
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 16.0,
                left: 0.0,
                right: 0.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    sliderImages.length,
                        (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      height: 8.0,
                      width: currentIndex == index ? 24.0 : 8.0,
                      margin: const EdgeInsets.only(right: 4.0),
                      decoration: BoxDecoration(
                        color: currentIndex == index
                            ? kPrimaryColor
                            : kLightColor,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 150.0,
                    width: double.infinity,
                    color: GlobalVariables.primaryColor,
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 15.0),




                      const Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          'What do you want to buy?',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 23.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(5.0),
                          child: TextFormField(
                              onFieldSubmitted: navigateToSearchScreen,
                              decoration:  InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon:  IconButton(
                                      color:
                                      GlobalVariables.primaryColor,
                                      icon: const Icon(Icons.search),
                                    onPressed: (){

                                    }, ),
                                  contentPadding:
                                  const EdgeInsets.only(left: 15.0, top: 15.0),
                                  hintText: 'Search',
                                  hintStyle: const TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Quicksand'))),
                        ),
                      ),
                      const SizedBox(height: 10.0)
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const StickyLabel(text: "Recommended", textColor:Colors.black,),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ViewAllCategory(),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(right: 8),
                      child:
                      StickyLabel(text: "View All", textColor: kPrimaryColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              const TopCategories(),

              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const StickyLabel(text: "Recommended", textColor:Colors.black,),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ViewAll(),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(right: 8),
                      child:
                      StickyLabel(text: "View All", textColor: kPrimaryColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              const DealsOfDay(),


            ],
          ),



        ],
      ),

    );
  }


  }
