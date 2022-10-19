import 'package:flutter/material.dart';
import 'package:swap/constants/GlobalVariables.dart';



class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;

  final action;
  const DefaultAppBar({
    Key? key, required this.title,  this.action,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(56.0);
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, ),
      centerTitle: true,
      backgroundColor: GlobalVariables.primaryColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(Icons.arrow_back_ios_new_outlined),
      ),
      actions: action,
    );
  }
}