import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:job_finder/core/my_cache_keys.dart';
import 'package:job_finder/data/local_data/my_cache.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/screens.dart';
import '../../../../style/colors.dart';
import '../../../../views/back_arrow_button.dart';
import '../../../../widgets/my_button.dart';

class TwoStepVerificationScreen4 extends StatefulWidget {
  const TwoStepVerificationScreen4({super.key});

  @override
  State<TwoStepVerificationScreen4> createState() =>
      _TwoStepVerificationScreen4State();
}

class _TwoStepVerificationScreen4State
    extends State<TwoStepVerificationScreen4> {
  int timeLeft = 60;

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft <= 0) {
        timer.cancel();
      } else {
        setState(() {
          timeLeft--;
        });
      }
    });
  }

  String phoneNumber = MyCache.getString(key: MyCacheKeys.profilePhoneNumber);
  String code = '';

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
      body: SingleChildScrollView(
        child: Container(
          height: 88.h,
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter the 6 digit code',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Please confirm your account by entering the authorization code sen to ${'*' * (phoneNumber.length - 4)}${phoneNumber.substring(phoneNumber.length - 4)}',
                style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey[800],
                    overflow: TextOverflow.visible),
              ),
              SizedBox(
                height: 3.h,
              ),
              Center(
                child: PinCodeTextField(
                  appContext: context,
                  length: 6,
                  onChanged: (value) {
                    code = value;
                  },
                  onCompleted: (value) {
                    if (kDebugMode) {
                      print('Completed: $value');
                    }
                  },
                  textStyle: TextStyle(
                    fontSize: 16.sp,
                  ),
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderWidth: 0.5,
                    borderRadius: BorderRadius.circular(10.sp),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    activeColor: grey,
                    inactiveColor: grey,
                    activeFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),

                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          if (timeLeft == 0) {
                            timeLeft = 60;
                            startCountdown();
                          }
                        });
                      },
                      child: Text(
                        'Resend code',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey[600],
                            overflow: TextOverflow.visible),
                      ),
                    ),
                    Text(
                      '${timeLeft}s',
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: blue,
                          overflow: TextOverflow.visible),
                    ),
                  ],
                ),

              const Spacer(),
              Center(
                child: MyButton(
                  onPressed: () {
                    if (code.length == 6) {
                      Fluttertoast.showToast(
                          msg: "Your active identity has been verified",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 5,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 14.sp);
                      MyCache.putBool(key: MyCacheKeys.isTwoStepVerify, value: true);
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        homeLayoutScreen,
                        (route) => false,
                      );
                    } else {
                      Fluttertoast.showToast(
                          msg: "You must enter the code correctly",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 5,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 14.sp);
                    }
                  },
                  text: 'Send Code',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
