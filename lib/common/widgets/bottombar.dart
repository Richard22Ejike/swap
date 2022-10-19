import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:swap/constants/GlobalVariables.dart';
import 'package:badges/badges.dart';
import 'package:swap/features/Profile/screens/ProfileScreen.dart';
import 'package:swap/features/home/screen/homescreen.dart';
import 'package:provider/provider.dart';
import '../../features/Cart/screens/cart1.dart';
import '../../features/favorite/screens/favoriteScreen.dart';
import '../../providers/user_providers.dart';
import 'appbar.dart';

class bottomBar extends StatefulWidget {
  static const String routeName = "/bottom-bar";
  const bottomBar({Key? key}) : super(key: key);

  @override
  State<bottomBar> createState() => _bottomBarState();
}

class _bottomBarState extends State<bottomBar> {
  int _page = 0;

  List<Widget>pages=[
    const HomeScreen(),
    const CartScreen(),
    const FavouriteScreen(),
    const ProfileScreen(),
  ];
  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }


  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;
    
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
        child: appBar(),),
       body: pages[_page],
       bottomNavigationBar:CurvedNavigationBar(
        backgroundColor: GlobalVariables.backgroundColor,
        buttonBackgroundColor: GlobalVariables.primaryColor,
         color: GlobalVariables.secondaryColor,
         onTap: updatePage,
         height: 50,
         items:  [

             const Icon(
                 Icons.home_outlined, size: 30
             ),

             Badge(
                 alignment: Alignment.topLeft,
                 elevation: 0,
                 badgeContent: Text(userCartLen.toString()),
                 badgeColor: Colors.white,
                 child: const Icon(Icons.shopping_bag_outlined, size: 30)),
             const Icon(Icons.favorite_border_outlined, size: 30),
             const Icon(Icons.person_outline_outlined, size: 30),


         ],

       ) ,
    );
  }
}
