import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/applied_cubit/applied_cubit.dart';
import '../../style/colors.dart';

class AppliedJobItemButton extends StatefulWidget {
  final AppliedCubit appliedCubit;
  final int thisIndex;
  const AppliedJobItemButton({super.key, required this.appliedCubit, required this.thisIndex});

  @override
  State<AppliedJobItemButton> createState() => _AppliedJobItemButtonState();
}

class _AppliedJobItemButtonState extends State<AppliedJobItemButton> {

  @override
  void didChangeDependencies() {

    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        widget.appliedCubit.changeJobDetailScreensIndex(widget.thisIndex);
      },
      child: Container(
        height: 7.h,
        width: 45.w,
        decoration: BoxDecoration(
            color: widget.appliedCubit.currentAppliedJobIndex == widget.thisIndex
                ? const Color(0xff02337A)
                : grey,
            borderRadius: BorderRadius.circular(25.sp)),
        child: Center(
            child: Text(
              widget.appliedCubit.appliedJobTitles[widget.thisIndex],
              style: TextStyle(
                  fontSize: 12.sp,
                  color: widget.appliedCubit.currentAppliedJobIndex == widget.thisIndex
                      ? Colors.white
                      : Colors.black),
            )),
      ),
    );
  }
}
