

import 'package:flutter/material.dart';
class listItem extends StatelessWidget {
  final String title;
  final Color buttonColor;
  final IconData iconButton;
  final VoidCallback onTap;
  listItem({Key? key,
    required this.title,
    required this.buttonColor,
    required this.iconButton,
    required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: buttonColor.withOpacity(0.3)
            ),
            child: Icon(
                iconButton,
                color: buttonColor,
                size: 25.0
            ),
          ),
          const SizedBox(width: 25.0),
          SizedBox(
            width: MediaQuery.of(context).size.width - 100.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(title,
                  style: const TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.transparent,),
                  child: InkWell(
                    onTap: onTap,
                    child:  const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 20.0
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );

  }
}


