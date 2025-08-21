import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:job_finder/business_logic/profile_cubit/profile_cubit.dart';
import 'package:job_finder/core/my_cache_keys.dart';
import 'package:job_finder/data/local_data/my_cache.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/screens.dart';
import '../../../../style/colors.dart';
import '../../../../views/back_arrow_button.dart';
import '../../../../widgets/my_button.dart';
import '../../../../widgets/my_job_text_field.dart';
import '../../../../widgets/my_text_form_field.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _newPasswordController2 = TextEditingController();


  late ProfileCubit profileCubit;

  @override
  void didChangeDependencies() {
    profileCubit = ProfileCubit.get(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is UpdateUserDataSuccessState){
          Fluttertoast.showToast(
              msg: "The password has been changed successfully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 14.sp);
          Navigator.pushNamedAndRemoveUntil(context, homeLayoutScreen, (route) => false);
          MyCache.putString(key: MyCacheKeys.password, value: profileCubit.newPassword);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: BackArrowButton(context: context),
          elevation: 0,
          centerTitle: true,
          title: Text(
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
                    SizedBox(height: 2.h),
                    Text('Enter your old password',
                        style: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.bold)),
                    SizedBox(height: 2.h),
                    MyTextFormField(
                      controller: _oldPasswordController,
                      hintText: 'Enter your old password',
                      textInputType: TextInputType.text,
                      obscureText: true,
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(10.sp),
                        child:
                        SvgPicture.asset('assets/images/home_layout/lock.svg'),
                      ),
                      onChanged: (text) {
                        profileCubit.oldPassword = text;
                      },
                    ),
                    SizedBox(height: 4.h),

                    Text('Enter your new password',
                        style: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.bold)),
                    SizedBox(height: 2.h),
                    MyTextFormField(
                      controller: _newPasswordController,
                      hintText: 'Enter your new password',
                      textInputType: TextInputType.text,
                      obscureText: true,
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(10.sp),
                        child:
                        SvgPicture.asset('assets/images/home_layout/lock.svg'),
                      ),
                      onChanged: (text) {
                        profileCubit.newPassword = text;
                      },
                    ),
                    SizedBox(height: 4.h),

                    Text('Confirm your new password',
                        style: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.bold)),
                    SizedBox(height: 2.h),
                    MyTextFormField(
                      controller: _newPasswordController2,
                      hintText: 'Confirm your new password',
                      textInputType: TextInputType.text,
                      obscureText: true,
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(10.sp),
                        child:
                        SvgPicture.asset('assets/images/home_layout/lock.svg'),
                      ),
                      onChanged: (text) {
                        profileCubit.newPassword2 = text;
                      },
                    ),
                    SizedBox(height: 4.h),
                  ],
                ),
                const Spacer(),
                MyButton(
                  onPressed: () {
                    profileCubit.confirmUpdatePassword();
                  },
                  text: 'Save',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
