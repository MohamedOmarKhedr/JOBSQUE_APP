import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:job_finder/data/models/finish_screen_model.dart';
import 'package:sizer/sizer.dart';

import '../../../core/screens.dart';
import '../../style/colors.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_text_form_field.dart';

class ResetPasswordScreen2 extends StatefulWidget {
  const ResetPasswordScreen2({super.key});

  @override
  State<ResetPasswordScreen2> createState() => _ResetPasswordScreen2State();
}

class _ResetPasswordScreen2State extends State<ResetPasswordScreen2> {
  final TextEditingController _passwordController1 = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();



  String password1 = '';
  String password2 = '';

  void onNextPage(BuildContext context) {


    if (password1.length >= 8 && password1 == password2 ) {
      FinishScreenModel finishScreenModel = FinishScreenModel(
          title: 'Password changed successfully!',
          subTitle: 'Your password has been changed successfully, we will let you know if there are more problems with your account',
          imagePath: 'assets/images/Password Succesfully Ilustration.svg',
          buttonText: 'Go To Login',
          onPressed: (context) {
            Navigator.pushNamedAndRemoveUntil(context, loginScreen, (route) => false);
          },
          isIconButton: false, isButton: true);
      Navigator.pushNamedAndRemoveUntil(
          context, finishScreen,arguments: finishScreenModel, (route) => false);
    } else if (password1.length < 8){
      Fluttertoast.showToast(
          msg: "Password must be at least 8 characters",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 14.sp);
    } else{
      Fluttertoast.showToast(
          msg: "Both password must match",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 14.sp);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_sharp)),
        elevation: 0,
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 3.w),
              child: SvgPicture.asset(
                "assets/images/Logo.svg",
                width: 80,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 90.h,
          padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 4.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    'Reset Password',
                    style:
                    TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Text(
                    'Enter the email address you used when you joined and we’ll send you instructions to reset your password.',
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextFormField(
                        controller: _passwordController1,
                        hintText: 'Password',
                        obscureText: true,
                        textInputType: TextInputType.visiblePassword,
                        prefixIcon: const Icon(Icons.lock_outline_rounded),
                        onChanged: (text) {
                          setState(() {
                            password1 = text;
                          });
                        },
                      ),
                      SizedBox(height: 1.h),
                      const Text(
                        'Password must be at least 8 characters',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 3.h,),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextFormField(
                        controller: _passwordController2,
                        hintText: 'Confirm Password',
                        obscureText: true,
                        textInputType: TextInputType.visiblePassword,
                        prefixIcon: const Icon(Icons.lock_outline_rounded),
                        onChanged: (text) {
                          setState(() {
                            password2 = text;
                          });
                        },
                      ),
                      SizedBox(height: 1.h),
                      const Text(
                        'Both password must match',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'You remember your password',
                        style: TextStyle(color: Colors.grey, fontSize: 10.sp),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                                context, loginScreen, (route) => false);
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(color: blue, fontSize: 10.sp),
                          ))
                    ],
                  ),
                  if (password1 != ''&& password2 != '')
                    MyButton(
                      onPressed: () {
                        onNextPage(context);
                      },
                      text: 'Request password reset',
                    )
                  else
                    MyButton(
                      onPressed: () {},
                      text: 'Request password reset',
                      backgroundColor: grey,
                      textColor: Colors.black,
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
