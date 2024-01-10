import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../style/colors.dart';

class MyTextFormField extends StatefulWidget {
  final bool? obscureText;
  final Widget? prefixIcon;
  final String hintText;
  final void Function(String) onChanged;
  final TextEditingController controller;
  final TextInputType? textInputType;
  final String? Function(String?)? validate;
  final bool? error;

  const MyTextFormField(
      {Key? key,
      this.obscureText = false,
      required this.controller,
      required this.hintText,
      required this.prefixIcon,
      this.validate,
      required this.onChanged, this.error=false, this.textInputType})
      : super(key: key);

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  late bool isHiding;
  @override
  void initState() {
    isHiding = widget.obscureText ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
        controller: widget.controller,
        onChanged: widget.onChanged,
        validator: widget.validate,
        obscureText: isHiding,
        keyboardType: widget.textInputType,
        decoration: InputDecoration(

          contentPadding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 3.w) ,
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: grey),
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.obscureText == false
              ? const SizedBox()
              : Visibility(
                  visible: isHiding == false,
                  replacement: IconButton(
                      onPressed: () {
                        setState(() {
                          isHiding = false;
                        });
                      },
                      icon: const Icon(Icons.visibility_off)),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          isHiding = true;
                        });
                      },
                      icon: const Icon(Icons.visibility))),
          border:OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffF4F4F4),width: 1),
            borderRadius: BorderRadius.circular(6.sp),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: widget.error==false? const BorderSide(color: blue,width: 1.5):const BorderSide(color: Colors.red,width: 2),
            borderRadius: BorderRadius.circular(6.sp),
          ),
        ),
      );
  }
}
