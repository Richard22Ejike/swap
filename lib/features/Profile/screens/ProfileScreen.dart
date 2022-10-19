import 'package:flutter/material.dart';
import 'package:swap/features/Account/Screens/Account.dart';
import 'package:swap/features/Notification/Screens/NotificationScreen.dart';

import '../../../constants/GlobalVariables.dart';
import '../../CustomerService/Screens/CustomerService.dart';
import '../../giftcard/screens/GiftCard.dart';
import '../../orders/screens/order.dart';
import '../../swap/screens/swapScreen.dart';
import '../../wallet/Screens/WalletScreen.dart';
import '../services/profileservices.dart';
import '../widgets/listItem.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

 navigateToCategoryPage(BuildContext context, String category) {
    Navigator.pushNamed(context, OrdersScreen.routeName,
        arguments: category);
  }

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>  with SingleTickerProviderStateMixin

{

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: ListView(children: <Widget>[
          Column(children: <Widget>[
            Stack(children: <Widget>[
              Container(
                height: 130.0,
                width: double.infinity,
                color: GlobalVariables.primaryColor,
              ),


              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 15.0),
                  const SizedBox(width: 15.0),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          IconButton(
                            icon: const Icon(Icons.mode_of_travel),
                            color: Colors.white,
                            iconSize: 40.0,
                            onPressed: () =>   Navigator.pushNamed(context, OrdersScreen.routeName,),
    ),

                          const Text(
                            'Orders',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 15.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          IconButton(
                            icon: const Icon(Icons.account_balance_wallet),
                            color: Colors.white,
                            iconSize: 40.0,
                            onPressed: () =>   Navigator.pushNamed(context, WalletScreen.routeName,),

                          ),
                          const Text(
                            'Wallet',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 15.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          IconButton(
                            icon: const Icon(Icons.swap_horizontal_circle),
                            color: Colors.white,
                            iconSize: 40.0,
                            onPressed: () =>   Navigator.pushNamed(context, SwapScreen.routeName,),
                          ),
                          const Text(
                            'Swap',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 15.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          IconButton(
                            icon: const Icon(Icons.notifications),
                            color: Colors.white,
                            iconSize: 40.0,
                            onPressed: () =>   Navigator.pushNamed(context, NotificationScreen.routeName,),
                          ),
                          const Text(
                            'Notification',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 15.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),

                ],
              )
            ]),
             SizedBox(height: 15.0),
            listItem(title: 'Gift card', buttonColor: Colors.red, iconButton:Icons.wallet_giftcard, onTap: () =>   Navigator.pushNamed(context, GiftCardScreen.routeName,),),
            listItem(title:'Bank card',  buttonColor: GlobalVariables.primaryColor, iconButton:Icons.credit_card, onTap: () =>   Navigator.pushNamed(context, AccountScreen.routeName,),),
            listItem(title:'Customer service',  buttonColor: GlobalVariables.primaryColor, iconButton:Icons.person, onTap: () =>   Navigator.pushNamed(context, CustomerService.routeName,),),
            listItem(title:'Log Out',  buttonColor: GlobalVariables.secondaryColor, iconButton:Icons.logout, onTap: () => ProfileServices().logOut(context),),
          ])
        ]),

      );
  }




  }



