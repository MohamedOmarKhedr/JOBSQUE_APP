import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/my_cache_keys.dart';
import '../../../../../core/screens.dart';
import '../../../../../data/local_data/my_cache.dart';
import '../../../../style/colors.dart';
import '../../../../views/back_arrow_button.dart';
import '../../../../widgets/my_button.dart';
import '../../../../widgets/my_job_text_field.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({super.key});

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  String phoneNumber = MyCache.getString(key: MyCacheKeys.profilePhoneNumber);
  final TextEditingController _phoneNumberController = TextEditingController(
      text: MyCache.getString(key: MyCacheKeys.profilePhoneNumber));
  late bool forResetPassword;
  late bool visible= MyCache.getBool(key: MyCacheKeys.forResetPassword);

  CountryCode countryCode = CountryCode(name: 'EG', dialCode: '+20');
  @override
  Widget build(BuildContext context) {
    forResetPassword = MyCache.getBool(key: MyCacheKeys.forResetPassword);

    return Scaffold(
      appBar: AppBar(
        leading: BackArrowButton(context: context),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Phone number',
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
                    'Main phone number',
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  MyJobTextField(
                    controller: _phoneNumberController,
                    hintText: 'Main phone number',
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
                  SizedBox(height: 1.h),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    height: 5.h,
                    width: 68.w,
                    child: Text(
                      'Use the phone number to reset your password',
                      style: TextStyle(fontSize: 10.sp,color: Colors.grey[500],overflow: TextOverflow.visible),
                    ),
                  ),
                  SizedBox(width: 5.w,),
                  Visibility(
                      visible: visible,
                      replacement: IconButton(
                        onPressed: () {
                          setState(() {
                            visible=true;
                            forResetPassword=true;
                          });
                        },
                        icon: SvgPicture.asset('assets/images/home_layout/Toggle.svg'),
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            visible=false;
                            forResetPassword=false;
                          });
                        },
                        icon: SvgPicture.asset('assets/images/home_layout/Toggle2.svg'),
                      ))
                ],
              ),
              const Spacer(),
              MyButton(
                onPressed: () {
                  MyCache.putString(
                      key: MyCacheKeys.profilePhoneNumber, value: phoneNumber);
                  MyCache.putBool(key: MyCacheKeys.forResetPassword, value: forResetPassword);
                  Navigator.pushNamedAndRemoveUntil(
                      context, homeLayoutScreen, (route) => false);
                },
                text: 'Save',

              )
            ],
          ),
        ),
      ),
    );
  }
}
