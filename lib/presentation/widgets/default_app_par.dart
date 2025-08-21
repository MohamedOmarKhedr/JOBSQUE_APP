import 'package:flutter/material.dart';
import 'package:job_finder/presentation/style/colors.dart';
import 'package:job_finder/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const DefaultAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: darkRed,
      centerTitle: true,
      elevation: 8.0,
      title: DefaultText(
          text: title,
          textColor: white,
          weight: FontWeight.bold,
          textSize: 14.sp,
          maxLines: 2),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(8.h);
}
