
import 'package:flutter/material.dart';


import '../../../common/widgets/Loader.dart';
import '../../../common/widgets/pageappbar.dart';
import '../../../common/widgets/singleProduct.dart';
import '../../../constants/GlobalVariables.dart';
import '../../../models/order.dart';
import '../orderServices/OrderServices.dart';
import 'orderDetails.dart';


class OrdersScreen extends StatefulWidget {
  static const String routeName = '/order';

  const OrdersScreen({
    Key? key,

  }) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List<Order>? orders;
  final OrderServices accountServices = OrderServices();

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    orders = await accountServices.fetchMyOrders(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold

      (
      appBar: const DefaultAppBar(title: 'Orders',),
      body:
      orders == null
        ? const Loader()
        : Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: const EdgeInsets.only(
                        left: 15,
                      ),
                      child: const Text(
                        'Your Orders',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  right: 15,
                ),
                child: Text(
                  'See all',
                  style: TextStyle(
                    color: GlobalVariables.selectedNavBarColor,
                  ),
                ),
              ),
            ],
          ),
          // display orders
          Container(
            height: 500,
            padding: const EdgeInsets.only(
              left: 10,
              top: 20,
              right: 0,
            ),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: orders!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      OrderDetailScreen.routeName,
                      arguments: orders![index],
                    );
                  },
                  child: SingleProduct(
                    image: orders![index].products[0].images[0],
                  ),
                );
              },
            ),
          ),
      ],
    ),
        ),
    );
  }
}