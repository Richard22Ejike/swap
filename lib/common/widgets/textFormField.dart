import 'package:flutter/material.dart';
import 'package:swap/constants/GlobalVariables.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIconData;
  final IconData? suffixIconData;
  final int maxLines;
  final VoidCallback ? onTap;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
    this.prefixIconData,
    this.suffixIconData,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: onTap,
            child: Icon(
              suffixIconData,
              size: 18,
              color: GlobalVariables.primaryColor,
            ),
          ),
          prefixIcon: Icon(
            prefixIconData,
            size: 18,
            color: GlobalVariables.primaryColor,
          ),
          hintText: hintText,
          border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black38,
              )),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black38,
              ))),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your $hintText';
        }
        return null;
      },
      maxLines: maxLines,
    );
  }
}