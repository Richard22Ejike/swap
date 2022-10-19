
import 'package:flutter/material.dart';
import 'package:swap/common/widgets/bottombar.dart';
import 'package:swap/features/CustomerService/Screens/CustomerService.dart';
import 'package:swap/features/auth/screens/registerScreen.dart';
import 'package:swap/features/favorite/screens/favoriteScreen.dart';
import 'package:swap/features/swap/screens/addScreen.dart';
import 'package:swap/features/swap/screens/swapScreen.dart';

import 'features/Account/Screens/Account.dart';
import 'features/Notification/Screens/NotificationScreen.dart';
import 'features/Product/screens/productScreen.dart';
import 'features/address/screens/adddressScreen.dart';
import 'features/auth/screens/authScreen.dart';
import 'features/giftcard/screens/GiftCard.dart';
import 'features/home/screen/categoryDealsScreen.dart';
import 'features/orders/screens/order.dart';
import 'features/orders/screens/orderDetails.dart';
import 'features/search/screens/search_screen.dart';
import 'features/wallet/Screens/WalletScreen.dart';
import 'models/order.dart';
import 'models/product.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings){
  switch (routeSettings.name){
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen()
      );
    case registerScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const registerScreen()
      );
      case bottomBar.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const bottomBar()
      );
    case OrdersScreen.routeName:

      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) =>  OrdersScreen(
          )
      );
    case FavouriteScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const FavouriteScreen()
      );
    case WalletScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const WalletScreen()
      );
    case SwapScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const SwapScreen()
      );
    case NotificationScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const NotificationScreen()
      );
    case AccountScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const AccountScreen()
      );
    case CustomerService.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const CustomerService()
      );
    case AddScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const AddScreen()
      );
    case GiftCardScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const GiftCardScreen()
      );
    case AddressScreen.routeName:
      var totalAmount = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AddressScreen(
          totalAmount: totalAmount,
        ),
      );
    case CategoryDealsScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CategoryDealsScreen(
          category: category,
        ),
      );
    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchScreen(
          searchQuery: searchQuery,
        ),
      );
    case ProductScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ProductScreen(
          product: product,
        ),
      );
    case OrderDetailScreen.routeName:
      var order = routeSettings.arguments as Order;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => OrderDetailScreen(
          order: order,
        ),
      );
    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const Scaffold(
            body: Center(
              child:
              Text(' Screen does not exist',)
            ),
          ));
  }
}