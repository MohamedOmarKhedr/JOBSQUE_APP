import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../style/colors.dart';

class SearchTextField extends StatefulWidget {
  final TextEditingController? controller;

  final void Function(String)? onChanged;

  final String? hintText;

  const SearchTextField({super.key, this.controller, this.onChanged, this.hintText='Search...'});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      child: TextField(
        controller: widget.controller,
        onChanged: widget.onChanged,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: IconButton(onPressed: () {  }, icon: SvgPicture.asset('assets/images/home_layout/search-normal.svg'),),
          enabledBorder:OutlineInputBorder(
              borderSide:  const BorderSide(color: grey,width: 1),
              borderRadius: BorderRadius.circular(25.sp)),
          border: OutlineInputBorder(
              borderSide:  const BorderSide(color: grey,width: 1),
              borderRadius: BorderRadius.circular(25.sp)),
          hintText: widget.hintText,
          hintStyle: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.normal,color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
        ),
      ),
    );
  }
}
