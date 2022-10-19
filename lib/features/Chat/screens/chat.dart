
import 'package:flutter/material.dart';

import '../../../common/widgets/emptysection.dart';
import '../../../common/widgets/pageappbar.dart';
import '../../../constants/GlobalVariables.dart';

class Chat extends StatefulWidget {
  Chat({Key ? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: DefaultAppBar(
        title: "Chat",

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: EmptySection(

              emptyMsg: "No message yet", emptyImg: '',
            ),
          ),
          Expanded(
            flex: 0,
            child: Material(
              elevation: 1,
              color: kWhiteColor,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        color: kPrimaryColor,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: kAccentColor),
                            color: kWhiteColor),
                        child: TextField(
                          cursorColor: kPrimaryColor,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter some text to send a message",
                            hintStyle: TextStyle(color: kLightColor),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.email,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}