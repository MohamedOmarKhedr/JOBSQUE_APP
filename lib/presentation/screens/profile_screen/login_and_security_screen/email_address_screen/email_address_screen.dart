import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_finder/core/my_cache_keys.dart';
import 'package:job_finder/data/local_data/my_cache.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/screens.dart';
import '../../../../style/colors.dart';
import '../../../../views/back_arrow_button.dart';
import '../../../../widgets/my_button.dart';
import '../../../../widgets/my_job_text_field.dart';
import '../../../../widgets/my_text_form_field.dart';

class EmailAddressScreen extends StatefulWidget {
  const EmailAddressScreen({super.key});

  @override
  State<EmailAddressScreen> createState() => _EmailAddressScreenState();
}

class _EmailAddressScreenState extends State<EmailAddressScreen> {
  String email = MyCache.getString(key: MyCacheKeys.email);
  final TextEditingController _emailController =
      TextEditingController(text: MyCache.getString(key: MyCacheKeys.email));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackArrowButton(context: context),
        elevation: 0,
        centerTitle: true,
        title:Text(
          'Login and security',
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
                  Text('Main e-mail address',
                    style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  MyJobTextField(
                    controller: _emailController,
                    hintText: 'Main e-mail',
                    textInputType: TextInputType.text,
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(8.sp),
                      child: SvgPicture.asset('assets/images/home_layout/sms.svg'),
                    ),
                    onChanged: (text) {
                      email=text;
                    },
                  ),
                  SizedBox(height: 1.h),
                ],
              ),
              const Spacer(),
              MyButton(
                onPressed: () {
                  MyCache.putString(key: MyCacheKeys.email, value: email);
                  Navigator.pushReplacementNamed(context, loginAndSecurityScreen,);
                },
                text: 'Save',
                backgroundColor: blue,
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
