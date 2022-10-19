import 'package:flutter/material.dart';



class NotificationTiles extends StatelessWidget {
  final String title, subtitle;
  final Icon icon;
  final VoidCallback onTap;
  final bool enable;
  const NotificationTiles({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.enable,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          height: 50.0,
          width: 50.0,
       child: icon,),
      title: Text(title, ),
      subtitle: Text(subtitle,
        ),
      onTap: onTap,
      enabled: enable,
    );
  }
}