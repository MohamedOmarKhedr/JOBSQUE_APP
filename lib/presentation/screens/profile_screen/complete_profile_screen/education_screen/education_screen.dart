import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_finder/business_logic/profile_cubit/profile_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/my_cache_keys.dart';
import '../../../../../data/local_data/my_cache.dart';
import '../../../../style/colors.dart';
import '../../../../views/back_arrow_button.dart';
import '../../../../widgets/my_button.dart';
import '../../../../widgets/my_job_text_field.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({super.key});

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  late TextEditingController _universityController;
  late TextEditingController _titleController;
  late TextEditingController _startYearController;
  late TextEditingController _endYearController;

  late ProfileCubit profileCubit;

  @override
  void didChangeDependencies() {
    profileCubit = ProfileCubit.get(context);
    _universityController =
        TextEditingController(text: profileCubit.educationUniversity);
    _titleController = TextEditingController(text: profileCubit.educationTitle);
    _startYearController =
        TextEditingController(text: profileCubit.educationStartYear);
    _endYearController =
        TextEditingController(text: profileCubit.educationEndYear);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: BackArrowButton(context: context),
            centerTitle: true,
            title: Text(
              'Education',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    padding: EdgeInsets.all(5.sp),
                    decoration: BoxDecoration(
                        border: Border.all(color: grey, width: 1),
                        borderRadius: BorderRadius.circular(8.sp)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 1.h, top: 2.h),
                          child: Text(
                            'University',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: grey),
                          ),
                        ),
                        MyJobTextField(
                          hintText: 'University',
                          onChanged: (text) {
                            profileCubit.educationUniversity = text;
                          },
                          controller: _universityController,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 1.h, top: 2.h),
                          child: Text(
                            'Title',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: grey),
                          ),
                        ),
                        MyJobTextField(
                          hintText: 'Title',
                          onChanged: (text) {
                            profileCubit.educationTitle = text;
                          },
                          controller: _titleController,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 1.h, top: 2.h),
                          child: Text(
                            'Start year',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: grey),
                          ),
                        ),
                        MyJobTextField(
                          hintText: 'Start year',
                          suffixIcon: Padding(
                            padding: EdgeInsets.all(8.sp),
                            child: SvgPicture.asset(
                                'assets/images/home_layout/calendar.svg'),
                          ),
                          onChanged: (text) {
                            profileCubit.educationStartYear = text;
                          },
                          controller: _startYearController,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 1.h, top: 2.h),
                          child: Text(
                            'End year',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: grey),
                          ),
                        ),
                        MyJobTextField(
                          hintText: 'End year',
                          suffixIcon: Padding(
                            padding: EdgeInsets.all(8.sp),
                            child: SvgPicture.asset(
                                'assets/images/home_layout/calendar.svg'),
                          ),
                          onChanged: (text) {
                            profileCubit.educationEndYear = text;
                          },
                          controller: _endYearController,
                        ),
                        SizedBox(height: 3.h),
                        Center(
                            child: MyButton(
                                onPressed: () {
                                  MyCache.putString(
                                      key: MyCacheKeys.educationUniversity,
                                      value: profileCubit.educationUniversity);
                                  MyCache.putString(
                                      key: MyCacheKeys.educationTitle,
                                      value: profileCubit.educationTitle);
                                  MyCache.putString(
                                      key: MyCacheKeys.educationStartYear,
                                      value: profileCubit.educationStartYear);
                                  MyCache.putString(
                                      key: MyCacheKeys.educationEndYear,
                                      value: profileCubit.educationEndYear);
                                  profileCubit.isEducationDone();
                                  Navigator.pop(context);
                                },
                                text: 'Save'))
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 12.h,
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                padding: EdgeInsets.all(5.sp),
                decoration: BoxDecoration(
                    border: Border.all(color: grey, width: 1),
                    borderRadius: BorderRadius.circular(8.sp)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/home_layout/Logo2.png'),
                    SizedBox(
                      width: 2.w,
                    ),
                    Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'The University of Arizona',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.sp,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            Text(
                              'Bachelor of Art and Design',
                              style: TextStyle(
                                  fontSize: 9.sp,
                                  color: Colors.grey[500],
                                  overflow: TextOverflow.ellipsis),
                            ),
                            Text(
                              '2012 - 2015',
                              style: TextStyle(
                                  fontSize: 9.sp,
                                  color: grey,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ],
                        )),
                    SvgPicture.asset('assets/images/home_layout/edit-2.svg')
                  ],
                ),
              ),
              SizedBox(height: 2.h,)
            ],
          ),
        );
      },
    );
  }
}
