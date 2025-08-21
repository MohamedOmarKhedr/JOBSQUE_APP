import 'package:country_code_picker/country_code_picker.dart';
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
import '../../../../widgets/my_job_text_field.dart';
import '../../../../widgets/my_text_form_field.dart';

class TwoStepVerificationScreen3 extends StatefulWidget {
  const TwoStepVerificationScreen3({super.key});

  @override
  State<TwoStepVerificationScreen3> createState() => _TwoStepVerificationScreen3State();
}

class _TwoStepVerificationScreen3State extends State<TwoStepVerificationScreen3> {
  final TextEditingController _phoneNumberController = TextEditingController(
      text: MyCache.getString(key: MyCacheKeys.profilePhoneNumber));
  final TextEditingController _passwordController = TextEditingController();

  String phoneNumber='';
  String password='';

  CountryCode countryCode = CountryCode(name: 'EG', dialCode: '+20');
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
                    'Enter Your phone number',
                    style:
                    TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'We will send a verification code to this number',
                    style:
                    TextStyle(fontSize: 10.sp, color: Colors.grey[500]),
                  ),
                  SizedBox(
                    height: 2.h
                  ),
                  MyTextFormField(
                    controller: _phoneNumberController,
                    hintText: 'Enter Your phone number',
                    textInputType: TextInputType.text,
                    prefixIcon: CountryCodePicker(
                      onChanged: (countryCode) {
                        this.countryCode = countryCode;
                      },
                      initialSelection: 'EG',
                      favorite: const ['+20', 'EG'],
                    ),
                    onChanged: (text) {
                      phoneNumber = text;
                    },
                  ),

                  SizedBox(height: 3.h),
                  Text('Enter your password',
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.bold)),
                  SizedBox(height: 2.h),
                  MyTextFormField(
                    controller: _passwordController,
                    hintText: 'Enter your password',
                    textInputType: TextInputType.text,
                    obscureText: true,
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(10.sp),
                      child:
                      SvgPicture.asset('assets/images/home_layout/lock.svg'),
                    ),
                    onChanged: (text) {
                      password = text;
                    },
                  ),
                  SizedBox(height: 4.h),


                ],
              ),
              const Spacer(),
              Center(
                child: MyButton(
                  onPressed: () {
                    if(password==MyCache.getString(key: MyCacheKeys.password)){
                      Fluttertoast.showToast(
                          msg: "Verification code has been sent to your number phone",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 5,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 14.sp);
                      Navigator.pushNamed(context, twoStepVerificationScreen4);
                    }
                    else{
                      Fluttertoast.showToast(
                          msg: "You must enter the password correctly",
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
