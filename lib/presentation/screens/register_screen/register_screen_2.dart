import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/register_cubit/register_cubit.dart';
import '../../../core/screens.dart';
import '../../views/auth_screens/jobs_item_button.dart';
import '../../widgets/my_button.dart';

class RegisterScreen2 extends StatefulWidget {
  const RegisterScreen2({super.key});

  @override
  State<RegisterScreen2> createState() => _RegisterScreen2State();
}

class _RegisterScreen2State extends State<RegisterScreen2> {
  late RegisterCubit registerCubit;


  @override
  void didChangeDependencies() {
    registerCubit = RegisterCubit.get(context);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
  builder: (context, state) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "What Type of work are you interested in?",
                style: TextStyle(
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                "Tell us what you're interested in so we can customise the app for you needs.",
                style: TextStyle(
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: (registerCubit.jobs.length / 2).ceil(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 1.h),
                      child: Row(
                        children: [
                          JobItemButton(
                            jobs: registerCubit.jobs[index * 2],
                            onTap: () {
                              registerCubit.onClickedJob(index: index * 2);
                            },
                          ),
                          SizedBox(
                            width: 6.w,
                          ),
                          if (index * 2 != registerCubit.jobs.length - 1)
                            JobItemButton(
                              jobs: registerCubit.jobs[index * 2 + 1],
                              onTap: () {
                                registerCubit.onClickedJob(index: index * 2 + 1);
                              },
                            )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context, registerScreen3,(route) => false);
                    },
                    text: 'Next',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  },
);
  }
}
