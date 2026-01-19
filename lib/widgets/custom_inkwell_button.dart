import 'package:flutter/material.dart';
import '../widgets/custom_font.dart';
import '../constants.dart';

class CustomInkwellButton extends StatelessWidget {
  final VoidCallback onTap;
  final double height;
  final double width;
  final double fontSize;
  final String buttonName;
  final Icon icon;
  final FontWeight fontWeight;
  final Color bgColor;
  final Color fontColor;

  const CustomInkwellButton({
    super.key,
    required this.onTap,
    required this.height,
    required this.width,
    this.buttonName = '',
    this.bgColor = FB_DARK_PRIMARY,
    this.fontColor = Colors.white,
    this.fontSize = 15,
    this.icon = const Icon(null),
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: bgColor,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        splashColor: FB_SECONDARY,
        child: Container(
          height: height,
          width: width,
          alignment: Alignment.center,
          child: buttonName.isEmpty
              ? icon
              : CustomFont(
                  text: buttonName,
                  fontSize: fontSize,
                  color: fontColor,
                  fontWeight: fontWeight,
                ),
        ),
      ),
    );
  }
}