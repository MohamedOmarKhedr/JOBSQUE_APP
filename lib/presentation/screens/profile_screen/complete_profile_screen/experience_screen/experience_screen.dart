import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../../business_logic/profile_cubit/profile_cubit.dart';
import '../../../../../core/my_cache_keys.dart';
import '../../../../../data/local_data/my_cache.dart';
import '../../../../style/colors.dart';
import '../../../../views/back_arrow_button.dart';
import '../../../../widgets/my_button.dart';
import '../../../../widgets/my_job_text_field.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({super.key});

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {

  late TextEditingController _positionController;
  late TextEditingController _workTypeController;
  late TextEditingController _companyNameController;
  late TextEditingController _locationController;
  late TextEditingController _startYearController;

  late ProfileCubit profileCubit;

  @override
  void didChangeDependencies() {
    profileCubit = ProfileCubit.get(context);
    _positionController =
        TextEditingController(text: profileCubit.experiencePosition);
    _workTypeController = TextEditingController(text: profileCubit.experienceWorkType);
    _companyNameController = TextEditingController(text: profileCubit.experienceCompanyName);
    _locationController = TextEditingController(text: profileCubit.experienceLocation);
    _startYearController =
        TextEditingController(text: profileCubit.experienceStartYear);

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
              'Experience',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
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
                          'Position',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: grey),
                        ),
                      ),
                      MyJobTextField(
                        hintText: 'Position',
                        onChanged: (text) {
                          profileCubit.experiencePosition = text;
                        },
                        controller: _positionController,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 1.h, top: 2.h),
                        child: Text(
                          'Type of work',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: grey),
                        ),
                      ),
                      MyJobTextField(
                        hintText: 'Type of work',
                        onChanged: (text) {
                          profileCubit.experienceWorkType = text;
                        },
                        controller: _workTypeController,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 1.h, top: 2.h),
                        child: Text(
                          'Company name',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: grey),
                        ),
                      ),
                      MyJobTextField(
                        hintText: 'Company name',
                        onChanged: (text) {
                          profileCubit.experienceCompanyName = text;
                        },
                        controller: _companyNameController,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 1.h, top: 2.h),
                        child: Text(
                          'Location',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: grey),
                        ),
                      ),
                      MyJobTextField(
                        hintText: 'Location',
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(10.sp),
                          child: SvgPicture.asset('assets/images/home_layout/location.svg'),
                        ),
                        onChanged: (text) {
                          profileCubit.experienceLocation = text;
                        },
                        controller: _locationController,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 1.h, top: 2.h),
                        child: Text(
                          'Start Year',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: grey),
                        ),
                      ),
                      MyJobTextField(
                        hintText: 'Start Year',
                        onChanged: (text) {
                          profileCubit.experienceStartYear = text;
                        },
                        controller: _startYearController,
                      ),

                      SizedBox(height: 3.h),
                      Center(
                          child: MyButton(
                              onPressed: () {
                                MyCache.putString(
                                    key: MyCacheKeys.experiencePosition,
                                    value: profileCubit.experiencePosition);
                                MyCache.putString(
                                    key: MyCacheKeys.experienceWorkType,
                                    value: profileCubit.experienceWorkType);
                                MyCache.putString(
                                    key: MyCacheKeys.experienceCompanyName,
                                    value: profileCubit.experienceCompanyName);
                                MyCache.putString(
                                    key: MyCacheKeys.experienceLocation,
                                    value: profileCubit.experienceLocation);
                                MyCache.putString(
                                    key: MyCacheKeys.experienceStartYear,
                                    value: profileCubit.experienceStartYear);
                                profileCubit.isExperienceDone();
                                Navigator.pop(context);
                              },
                              text: 'Save'))
                    ],
                  ),
                ),
                SizedBox(height: 2.h,),
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
                      Image.asset('assets/images/home_layout/Logo3.png'),
                      SizedBox(
                        width: 2.w
                      ),
                      Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Senior UI/UX Designer',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.sp,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              Text(
                                'Remote • GrowUp Studio',
                                style: TextStyle(
                                    fontSize: 9.sp,
                                    color: Colors.grey[500],
                                    overflow: TextOverflow.ellipsis),
                              ),
                              Text(
                                '2019 - 2022',
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
          ),
        );
      },
    );
  }
}
