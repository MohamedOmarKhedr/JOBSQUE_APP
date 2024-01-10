import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:job_finder/core/my_cache_keys.dart';
import 'package:job_finder/data/local_data/my_cache.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/screens.dart';
import '../../../../style/colors.dart';
import '../../../../views/back_arrow_button.dart';
import '../../../../widgets/my_button.dart';

class TwoStepVerificationScreen extends StatefulWidget {
  const TwoStepVerificationScreen({super.key});

  @override
  State<TwoStepVerificationScreen> createState() =>
      _TwoStepVerificationScreenState();
}

class _TwoStepVerificationScreenState extends State<TwoStepVerificationScreen> {
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackArrowButton(context: context),
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Two-step verification',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8.sp),
                decoration: BoxDecoration(
                    border: Border.all(color: grey, width: 1),
                    borderRadius: BorderRadius.circular(6.sp)),
                child: Row(
                  children: [
                    SizedBox(
                      height: 5.h,
                      width: 50.w,
                      child: Text(
                        'Secure your account with two-step verification',
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.grey[500],
                            overflow: TextOverflow.visible),
                      ),
                    ),
                    const Spacer(),
                    Visibility(
                        visible: visible,
                        replacement: IconButton(
                          onPressed: () {
                            setState(() {
                              visible = true;
                            });
                          },
                          icon: SvgPicture.asset(
                              'assets/images/home_layout/Toggle.svg'),
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              visible = false;
                            });
                          },
                          icon: SvgPicture.asset(
                              'assets/images/home_layout/Toggle2.svg'),
                        ))
                  ],
                ),
              ),
              SizedBox(height: 3.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                      'assets/images/home_layout/Two Step Icon.svg'),
                  SizedBox(width: 4.w,),
                  SizedBox(
                    height: 8.h,
                    width: 70.w,
                    child: Center(
                      child: Text(
                        'Two-step verification provides additional security by asking for a verification code every time you log in on another device.',
                        style: TextStyle(
                            fontSize: 9.sp,
                            color: Colors.grey[500],
                            overflow: TextOverflow.visible),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                      'assets/images/home_layout/Two Step Icon2.svg'),
                  SizedBox(width: 4.w,),
                  SizedBox(
                    height: 8.h,
                    width: 70.w,
                    child: Center(
                      child: Text(
                          'Adding a phone number or using an authenticator will help keep your account safe from harm.',
                        style: TextStyle(
                            fontSize: 9.sp,
                            color: Colors.grey[500],
                            overflow: TextOverflow.visible),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              const Spacer(),
              MyButton(onPressed: () {
                  MyCache.putBool(key: MyCacheKeys.isTwoStepEnable, value: visible);
                  Navigator.pushNamed(context, twoStepVerificationScreen2);
              }, text: 'Next',)
            ],
          ),
        ));
  }
}
