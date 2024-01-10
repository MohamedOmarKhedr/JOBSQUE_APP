import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:job_finder/core/my_cache_keys.dart';
import 'package:job_finder/data/local_data/my_cache.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/login_cubit/login_cubit.dart';
import '../../../core/screens.dart';
import '../../style/colors.dart';
import '../../views/auth_screens/my_social_button.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool isChecked = false;

  late LoginCubit loginCubit;



  @override
  void didChangeDependencies() {
    loginCubit = LoginCubit.get(context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            Fluttertoast.showToast(
                msg: "The email or password isn't correct",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.sp);
          } else if (state is LoginSuccessState) {

            loginCubit.afterLoginSuccess();

            Navigator.pushNamedAndRemoveUntil(
                context, homeLayoutScreen, (route) => false);

            MyCache.putBool(key: MyCacheKeys.isLoginFinished, value: true);
          }
        },
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return SingleChildScrollView(
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
                          'Login',
                          style: TextStyle(
                              fontSize: 22.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        Text(
                          'Please login to find your dream job',
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
                              loginCubit.email = text;
                            });
                          },
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        MyTextFormField(
                          controller: _passwordController,
                          hintText: 'Password',
                          obscureText: true,
                          textInputType: TextInputType.visiblePassword,
                          prefixIcon: const Icon(Icons.lock_outline_rounded),
                          onChanged: (text) {
                            setState(() {
                              loginCubit.password = text;
                            });}
                        ),
                        SizedBox(height: 1.h),
                        Row(
                          children: [
                            Checkbox(
                              value: isChecked,
                              activeColor: blue,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });

                              },),

                            Text(
                              'Remember Me',
                              style: TextStyle(fontSize: 10.sp,),
                            ),
                            const Spacer(),
                            TextButton(onPressed: (){
                              Navigator.pushNamed(
                                  context, resetPasswordScreen,);
                            }, child: Text(
                              'Forgot Password?',
                              style: TextStyle(fontSize: 10.sp, color: blue),
                            ),)
                          ],
                        )
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
                              'Dont’t have an account?',
                              style:
                              TextStyle(color: Colors.grey, fontSize: 10.sp),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, registerScreen, (route) => false);
                                },
                                child: Text(
                                  'Register',
                                  style: TextStyle(color: blue, fontSize: 10.sp),
                                ))
                          ],
                        ),
                        if (
                        loginCubit.password != '' &&
                            loginCubit.email != '')
                          MyButton(
                            onPressed: () {

                                loginCubit.postLogin(
                                    email: loginCubit.email,
                                    password: loginCubit.password,
                                    );

                            },
                            text: 'Login',
                          )
                        else
                          MyButton(
                            onPressed: () {},
                            text: 'Login',
                            backgroundColor: grey,
                            textColor: Colors.black,
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                                child: Divider(
                                  height: 8.h,
                                )),
                            SizedBox(
                              width: 4.w,
                            ),
                            Text(
                              'Or Login With Account',
                              style:
                              TextStyle(fontSize: 12.sp, color: Colors.grey),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Expanded(
                                child: Divider(
                                  height: 8.h,
                                )),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            MySocialButton(
                                imagePath: 'assets/images/google.svg',
                                text: 'Google',
                                onTap: () {}),
                            SizedBox(
                              width: 5.w,
                            ),
                            MySocialButton(
                              imagePath: 'assets/images/Facebook.svg',
                              text: 'Facebook',
                              onTap: () {},
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
