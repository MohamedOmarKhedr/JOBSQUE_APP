import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:job_finder/presentation/widgets/my_text_form_field.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/register_cubit/register_cubit.dart';
import '../../../core/my_cache_keys.dart';
import '../../../core/screens.dart';
import '../../../data/local_data/my_cache.dart';
import '../../style/colors.dart';
import '../../views/auth_screens/my_social_button.dart';
import '../../widgets/my_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool isRegisterFinished =
      MyCache.getBool(key: MyCacheKeys.isRegisterFinished);

  late RegisterCubit registerCubit;

  @override
  void didChangeDependencies() {
    registerCubit = RegisterCubit.get(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: isRegisterFinished
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                }, icon: const Icon(Icons.arrow_back_sharp))
            : const Center(),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 3.w),
              child: SvgPicture.asset(
                "assets/images/Logo.svg",
                width: 80,
              )),
        ],
      ),
      body: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterErrorState) {
            Fluttertoast.showToast(
                msg: "You must enter correct email",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.sp);
          } else if (state is RegisterSuccessState) {
            Navigator.pushNamedAndRemoveUntil(
                context, registerScreen2, (route) => false);
          }
        },
        child: BlocBuilder<RegisterCubit, RegisterState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Container(
                height: 90.h,
                padding: const EdgeInsets.all(16.0),
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
                          'Create Account',
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        Text(
                          'Please create an account to find your dream job',
                          style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        MyTextFormField(
                          controller: _nameController,
                          hintText: 'Username',
                          obscureText: false,
                          textInputType: TextInputType.text,
                          prefixIcon: const Icon(Icons.person_2_outlined),
                          onChanged: (text) {
                            setState(() {
                              registerCubit.name = text;
                            });
                          },
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        MyTextFormField(
                          controller: _emailController,
                          hintText: 'Email',
                          obscureText: false,
                          textInputType: TextInputType.emailAddress,
                          prefixIcon: const Icon(Icons.email_outlined),
                          onChanged: (text) {
                            setState(() {
                              registerCubit.email = text;
                            });
                          },
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyTextFormField(
                              controller: _passwordController,
                              hintText: 'Password',
                              obscureText: true,
                              error: registerCubit.passwordError,
                              textInputType: TextInputType.visiblePassword,
                              prefixIcon: const Icon(Icons.lock_outline_rounded),
                              onChanged: (text) {
                                setState(() {
                                  registerCubit.password = text;
                                });
                                registerCubit.onChangePassword(
                                    text: text,
                                    password: registerCubit.password,
                                    passwordError: registerCubit.passwordError);
                              },
                            ),
                            SizedBox(height: 1.h),
                            Text(
                              registerCubit.message,
                              style: TextStyle(color: registerCubit.messageColor),
                            ),
                          ],
                        ),
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
                              'Already have an account?',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10.sp),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, loginScreen, (route) => false);
                                  MyCache.putBool(key: MyCacheKeys.isRegisterFinished, value: true);
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(color: blue, fontSize: 10.sp),
                                ))
                          ],
                        ),
                        if (registerCubit.email != '' &&
                            registerCubit.password != '' &&
                            registerCubit.name != '')
                          MyButton(
                            onPressed: () {
                              if (registerCubit.password.length >= 8) {
                                registerCubit.postRegister(
                                    email: registerCubit.email,
                                    password: registerCubit.password,
                                    name: registerCubit.name);
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Password must be at least 8 character",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 2,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.sp);
                              }
                            },
                            text: 'Create account',
                          )
                        else
                          MyButton(
                            onPressed: () {},
                            text: 'Create account',
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
                              'Or Sign up With Account',
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
