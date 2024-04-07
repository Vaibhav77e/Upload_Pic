import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  TextEditingController? controller;
  String? hintText;
  AppTextField({required this.controller,required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder()
            ),
          );
  }
}