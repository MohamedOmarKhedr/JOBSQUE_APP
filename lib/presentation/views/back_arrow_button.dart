import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class BackArrowButton extends StatefulWidget {
  final BuildContext context;
  const BackArrowButton({super.key, required this.context});

  @override
  State<BackArrowButton> createState() => _BackArrowButtonState();
}

class _BackArrowButtonState extends State<BackArrowButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(widget.context);
        },
        icon: SvgPicture.asset(
          'assets/images/home_layout/arrow-left.svg',
          height: 3.h,
          width: 8.w,
        ));
  }
}
