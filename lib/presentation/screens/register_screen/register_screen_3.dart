import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/register_cubit/register_cubit.dart';
import '../../../core/screens.dart';
import '../../../data/models/finish_screen_model.dart';
import '../../views/auth_screens/country_item_button.dart';
import '../../widgets/my_button.dart';

class RegisterScreen3 extends StatefulWidget {
  const RegisterScreen3({super.key});

  @override
  State<RegisterScreen3> createState() => _RegisterScreen3State();
}

class _RegisterScreen3State extends State<RegisterScreen3> {
  late RegisterCubit registerCubit;
  late FinishScreenModel finishScreenModel;

  @override
  void didChangeDependencies() {
    registerCubit = RegisterCubit.get(context);
    finishScreenModel = registerCubit.finishScreenModel;
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
                    "Where are you prefefred Location?",
                    style: TextStyle(
                      fontSize: 20.sp,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    "Let us know, where is the work location you want at this time, so we can adjust it.",
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  SvgPicture.asset('assets/images/Menu.svg'),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    "Select the country you want for your job",
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: (registerCubit.countries.length / 2).ceil(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: .75.h),
                          child: Row(
                            children: [
                              CountryItemButton(
                                countries: registerCubit.countries[index * 2],
                                onTap: () {
                                  registerCubit.onClickedCountry(
                                      index: index * 2);
                                },
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              if (index * 2 !=
                                  registerCubit.countries.length - 1)
                                CountryItemButton(
                                  countries:
                                      registerCubit.countries[index * 2 + 1],
                                  onTap: () {
                                    registerCubit.onClickedCountry(
                                        index: index * 2 + 1);
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
                          Navigator.pushNamedAndRemoveUntil(
                              context,
                              finishScreen,
                              arguments: finishScreenModel,
                              (route) => false);
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
