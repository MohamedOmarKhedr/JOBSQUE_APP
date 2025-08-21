import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/my_cache_keys.dart';
import '../../../../../core/screens.dart';
import '../../../../../data/local_data/my_cache.dart';
import '../../../../style/colors.dart';
import '../../../../views/back_arrow_button.dart';
import '../../../../widgets/my_button.dart';

class TwoStepVerificationScreen2 extends StatefulWidget {
  const TwoStepVerificationScreen2({super.key});

  @override
  State<TwoStepVerificationScreen2> createState() => _TwoStepVerificationScreen2State();
}

class _TwoStepVerificationScreen2State extends State<TwoStepVerificationScreen2> {
  bool visible = MyCache.getBool(key: MyCacheKeys.isTwoStepEnable);
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
              SizedBox(height: 3.h,),
              Text(
                'Select a verification method',
                style: TextStyle(
                    fontSize: 10.sp,
                    overflow: TextOverflow.visible),
              ),
              SizedBox(height: 2.h),
              Container(
                padding: EdgeInsets.symmetric(vertical: 1.h,horizontal:2.w),
                decoration: BoxDecoration(
                    border: Border.all(color: grey, width: 1),
                    borderRadius: BorderRadius.circular(6.sp)),
                child: Row(
                  children: [
                    Text(
                      'Telephone number (SMS)',
                      style: TextStyle(
                          fontSize: 10.sp,
                          overflow: TextOverflow.ellipsis),
                    ),
                    const Spacer(),
                    IconButton(onPressed: (){},
                    icon: SvgPicture.asset('assets/images/home_layout/arrow-down2.svg'),)
                  ],
                ),
              ),
              SizedBox(height: 2.h,),
              Text(
                'Note : Turning this feature will sign you out anywhere you’re currently signed in. We will then require you to enter a verification code the first time you sign with a new device or Joby mobile application.',
                style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.grey[500],
                    overflow: TextOverflow.visible),
              ),


              const Spacer(),
              Center(
                child: MyButton(onPressed: () {
                  if(visible) {
                    MyCache.putBool(key: MyCacheKeys.isTwoStepEnable, value: visible);
                    Navigator.pushNamed(context, twoStepVerificationScreen3);

                  }
                  else{
                    Fluttertoast.showToast(
                        msg: "You must enable button for Secure your account with two-step verification",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 5,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 14.sp);


                  }
                }, text: 'Next',),
              )
            ],
          ),
        ));
  }
}
