import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_project/constants/colors.dart';

class TextFormFieldWidget extends StatelessWidget {
  TextEditingController controller;
  TextInputType? textInputType;
  final String title;
  final Function validator;
  TextFormFieldWidget(
      {required this.title, required this.validator, required this.controller, this.textInputType });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      keyboardType: textInputType,
      controller: controller,
      validator: (x) => validator(x),
      decoration: InputDecoration(
        hintText: title,
        hintStyle:TextStyle(color: blue),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(5.5)
        ),
      ),
    );

  }
}