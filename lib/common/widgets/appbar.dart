import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swap/constants/GlobalVariables.dart';

import '../../providers/user_providers.dart';

class appBar extends StatelessWidget {
  const appBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalVariables.primaryColor,
        title:  Text(

          'Hello , ${user.name} - ${user.address}',
          style: const TextStyle(
              color: Colors.black,
              fontFamily: 'Quicksand',
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              onPressed: (){},
              icon: const Icon(Icons.menu),
              color: Colors.white,
              iconSize: 30.0,
            ),
          )
        ],
      ),
    );
  }
}
