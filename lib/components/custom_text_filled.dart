import 'package:flutter/material.dart';
import 'package:untitled4/mytheme.dart';

class CustomTextFilled extends StatelessWidget {
  String label;
  TextInputType textInputType;
  TextEditingController controller;
  String? Function(String?) validator;
  bool isPassword;
  CustomTextFilled({required this.label,this.textInputType=TextInputType.text,
    required this.controller,required this.validator,this.isPassword = false});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
           keyboardType: textInputType,
          controller: controller,
          validator: validator ,
          obscureText: isPassword,
          decoration: InputDecoration(
        label: Text(label),

        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 3,
              color: MyTheme.primaryLight,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 3,
              color: MyTheme.primaryLight,
            )),
      )),
    );
  }
}
