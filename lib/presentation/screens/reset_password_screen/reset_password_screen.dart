import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:job_finder/data/models/finish_screen_model.dart';
import 'package:job_finder/presentation/views/back_arrow_button.dart';
import 'package:sizer/sizer.dart';

import '../../../core/screens.dart';
import '../../style/colors.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_text_form_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  String email = '';

  void onNextPage(BuildContext context) {
    bool found1 = false;
    bool found2 = false;
    late int i;
    for (i = 0; i < email.length; i++) {
      if (email[i] == '@') {
        found1 = true;
        break;
      }
    }
    for (int j = i; j < email.length; j++) {
      if (email[j] == '.') {
        found2 = true;
        break;
      }
    }
    if (found1 && found2) {
      FinishScreenModel finishScreenModel = FinishScreenModel(
          title: 'Check your Email',
          subTitle: 'We have sent a reset password to your email address',
          imagePath: 'assets/images/Email Ilustration.svg',
          buttonText: 'Open email app',
          onPressed: (context) {
            Navigator.pushNamed(context, resetPasswordScreen2);
          },
          isIconButton: false, isButton: true);
      Navigator.pushNamedAndRemoveUntil(
          context, finishScreen,arguments: finishScreenModel, (route) => false);
    } else {
      Fluttertoast.showToast(
          msg: "You must enter a correct email",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.sp);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackArrowButton(context: context),
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
                  MyTextFormField(
                    controller: _emailController,
                    hintText: 'Email',
                    obscureText: false,
                    textInputType: TextInputType.text,
                    prefixIcon: const Icon(Icons.email_outlined),
                    onChanged: (text) {
                      setState(() {
                        email = text;
                      });
                    },
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
                  if (email != '')
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
