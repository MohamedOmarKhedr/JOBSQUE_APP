import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_finder/business_logic/profile_cubit/profile_cubit.dart';
import 'package:job_finder/core/screens.dart';
import 'package:job_finder/presentation/style/colors.dart';
import 'package:sizer/sizer.dart';

import '../../../core/my_cache_keys.dart';
import '../../../data/local_data/my_cache.dart';
import '../../views/my_title.dart';
import '../../views/profile_screen/profile_general_builder.dart';
import '../../views/profile_screen/profile_general_item.dart';
import '../../views/profile_screen/profile_other_builder.dart';
import '../../views/profile_screen/profile_other_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileCubit profileCubit;
  @override
  void didChangeDependencies() {
    profileCubit =ProfileCubit.get(context);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ProfileCubit, ProfileState>(
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffD6E4FF),
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                MyCache.putBool(key: MyCacheKeys.isLoginFinished, value: false);
                MyCache.putString(key: MyCacheKeys.jobCompName, value: '');
                profileCubit.afterLogoutSuccess();
                Navigator.pushNamedAndRemoveUntil(
                    context, loginScreen, (route) => false);
              },
              icon: SvgPicture.asset('assets/images/home_layout/logout.svg'))
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20.h,
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 15.h,
                      color: const Color(0xffD6E4FF),
                    ),
                    SizedBox(
                      height: 5.h,
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (MyCache.getString(key: MyCacheKeys.profileImagePath)=='')
                      Center(
                        child: Container(
                          height: 10.h,
                          width: 10.h,
                          padding: EdgeInsets.only(
                            top: 10.h,
                          ),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.white, width: 2.sp),
                              borderRadius: BorderRadius.circular(50.sp),
                              image: const DecorationImage(
                                image: AssetImage(
                                  'assets/images/home_layout/profile.png',
                                ),
                              )),
                        ),
                      )
                    else
                      Center(
                        child: Container(
                          height: 10.h,
                          width: 10.h,
                          padding: EdgeInsets.only(
                            top: 10.h,
                          ),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.white, width: 2.sp),
                              borderRadius: BorderRadius.circular(50.sp),
                              image: DecorationImage(
                                image: FileImage(profileCubit.fileImage!),
                              )),
                        ),
                      ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 2.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                MyCache.getString(key: MyCacheKeys.userName),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                    overflow: TextOverflow.ellipsis),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(MyCache.getString(key: MyCacheKeys.profileBio),
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12.sp,
                      overflow: TextOverflow.ellipsis)),
            ],
          ),
          Container(
            height: 8.h,
            padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
            margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
            decoration: BoxDecoration(
                color: const Color(0xffFAFAFA),
                borderRadius: BorderRadius.circular(8.sp)),
            child: Row(
              children: [
                const Spacer(),
                Column(
                  children: [
                    Text(
                      'Applied',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                          fontSize: 8.sp),
                    ),
                    const Spacer(),
                    Text(
                      '46',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.sp),
                    ),
                  ],
                ),
                const Spacer(),
                const VerticalDivider(color: grey),
                const Spacer(),
                Column(
                  children: [
                    Text(
                      'Reviewed',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                          fontSize: 8.sp),
                    ),
                    const Spacer(),
                    Text(
                      '23',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.sp),
                    ),
                  ],
                ),
                const Spacer(),
                const VerticalDivider(color: grey),
                const Spacer(),
                Column(
                  children: [
                    Text(
                      'Contacted',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                          fontSize: 8.sp),
                    ),
                    const Spacer(),
                    Text(
                      '46',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.sp),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Row(
              children: [
                Text(
                  'About',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                    fontSize: 12.sp,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Edit',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: blue,
                      fontSize: 12.sp,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Text(
              "I'm Rafif Dian Axelingga, I’m UI/UX Designer, I have experience designing UI Design for approximately 1 year. I am currently joining the Vektora studio team based in Surakarta, Indonesia.I am a person who has a high spirit and likes to work to achieve what I dream of.",
              style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 10.sp,
                  overflow: TextOverflow.visible),
            ),
          ),
          const MyTitle(text: 'General'),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 4.w),
            child: ProfileGeneralBuilder(profileGeneralData: profileCubit.profileGeneralData,),
          ),
          const MyTitle(text: 'Other'),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 4.w),
            child: ProfileOtherBuilder(profileOtherTitle: profileCubit.profileOtherTitle,),
          )

        ],
      ),
    );
  },
);
  }
}
