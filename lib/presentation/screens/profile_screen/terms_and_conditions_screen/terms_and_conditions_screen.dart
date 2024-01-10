import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../style/colors.dart';
import '../../../views/back_arrow_button.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  State<TermsAndConditionsScreen> createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackArrowButton(context: context),
        centerTitle: true,
        title: Text(
          'Terms & Conditions',
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 6.w,vertical: 3.h),
        child: ListView(
          children: [
            Text(
              'Lorem ipsum dolor sit amet',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
            ),
            SizedBox(height: 2.h),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ',
              style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.grey[600],
                  overflow: TextOverflow.visible),
            ),
            SizedBox(height: 2.h),
            Text(
              'Lorem ipsum dolor sit amet',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
            ),
            SizedBox(height: 2.h),
            Text(
              'Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.grey[600],
                  overflow: TextOverflow.visible),
            ),
            SizedBox(height: 2.h),
            Container(
              padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
              decoration: BoxDecoration(
                color: const Color(0xffF4F4F5),
                borderRadius: BorderRadius.circular(6.sp),
              ),
              child: Text(
                'Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at.',
                style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.grey[600],
                    overflow: TextOverflow.visible),
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at.',
              style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.grey[600],
                  overflow: TextOverflow.visible),
            ),
          ],
        ),
      ),
    );
  }
}
