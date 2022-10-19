import 'package:flutter/material.dart';

import '../../../common/widgets/custembutton.dart';
import '../../../common/widgets/emptysection.dart';
import '../../../common/widgets/pageappbar.dart';
import '../../Chat/screens/chat.dart';

class CustomerService extends StatefulWidget {
  static const String routeName = '/customer-care';
  const CustomerService({Key? key}) : super(key: key);

  @override
  State<CustomerService> createState() => _CustomerServiceState();
}

class _CustomerServiceState extends State<CustomerService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: const DefaultAppBar(
        title: "Call Center",

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const EmptySection(
            emptyImg: '',
            emptyMsg: "We're happy to help you!",
          ),
         const Text(
             "If you have complain about the product chat me",
          ),
          CustomButton(
            text: "Chat Me",
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Chat(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
