import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../style/colors.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final EdgeInsets? margin;
  final Color? backgroundColor;
  final Color? textColor;
  const MyButton(
      {Key? key, required this.onPressed, this.margin, required this.text, this.backgroundColor = blue, this.textColor = white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: 80.w, // 80% of the screen width
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor, // Set button color to blue
        ),
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
