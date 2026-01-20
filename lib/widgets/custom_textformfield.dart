import 'package:flutter/material.dart';
import '../constants.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isObscure;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final double fontSize;
  final Color fontColor;
  final double height;
  final double width;
  final Widget? suffixIcon;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.isObscure = false,
    required this.validator,
    required this.onSaved,
    required this.fontSize,
    required this.fontColor,
    required this.height,
    required this.width,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      validator: validator,
      onSaved: onSaved,
      style: TextStyle(fontSize: fontSize, color: fontColor),
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        fillColor: Colors.black12,
        filled: true,
        contentPadding: EdgeInsets.fromLTRB(width, height, width, height),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: FB_DARK_PRIMARY, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: FB_LIGHT_PRIMARY, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}