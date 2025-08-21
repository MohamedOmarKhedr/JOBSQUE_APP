import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_finder/business_logic/home_cubit/home_cubit.dart';
import 'package:job_finder/core/my_cache_keys.dart';
import 'package:job_finder/core/screens.dart';
import 'package:job_finder/data/local_data/my_cache.dart';
import 'package:sizer/sizer.dart';

import '../../style/colors.dart';
import '../../views/recent_job_item.dart';
import '../../views/suggested_job_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeCubit homeCubit;

  @override
  void didChangeDependencies() {
    homeCubit = HomeCubit.get(context)..getJobs();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
            child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Hi, ${MyCache.getString(key: MyCacheKeys.userName)}',
                                      style: TextStyle(
                                        fontSize: 25.sp,
                                      ),
                                    ),
                                    Text(
                                      'Create a better future for yourself here',
                                      style:
                                          TextStyle(fontSize: 10.sp, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, notificationScreen);
                                  },
                                  icon: SvgPicture.asset(
                                      'assets/images/home_layout/Notification.svg'),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            InkWell(
                              onTap: () {

                                Navigator.pushNamed(context, searchScreen);
                              },
                              child: Container(
                                height: 8.h,
                                padding:
                                    EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
                                decoration: BoxDecoration(
                                    border: Border.all(width: 1, color: grey),
                                    borderRadius: BorderRadius.circular(25.sp)),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 1.w,
                                    ),
                                    SvgPicture.asset(
                                        'assets/images/home_layout/search-normal.svg'),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text(
                                      'Search...',
                                      style:
                                          TextStyle(fontSize: 10.sp, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            if (MyCache.getString(key: MyCacheKeys.jobCompName) != '')
                              InkWell(
                                onTap: (){
                                  Map<String,dynamic> compData={
                                    'compName':MyCache.getString(key: MyCacheKeys.jobCompName),
                                    'imagePath':MyCache.getString(key: MyCacheKeys.jobImagePath),
                                    'isNetworkImage':true
                                  };
                                  Navigator.pushNamed(context, chatScreen,arguments: compData);
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 2.h),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                                  height: 15.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.sp),
                                      color: const Color(0xffD6E4FF)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 6.h,
                                        width: 12.w,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.sp),
                                          image: DecorationImage(
                                            image: NetworkImage(MyCache.getString(
                                                key: MyCacheKeys
                                                    .jobImagePath)), // Replace with your image asset
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 3.w,),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(bottom: 1.h),
                                              child: Text(
                                                MyCache.getString(key: MyCacheKeys.jobCompName),
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.bold,
                                                    overflow: TextOverflow.ellipsis),
                                              ),
                                            ),
                                            Text(
                                              'Waiting to be selected by the ${MyCache.getString(key: MyCacheKeys.jobCompName)} team',
                                              style: TextStyle(
                                                  fontSize: 10.sp,
                                                  color: Colors.grey[600],
                                                  overflow: TextOverflow.visible),
                                            ),
                                          ],
                                        ),
                                      ),

                                      SvgPicture.asset('assets/images/home_layout/summited.svg'),
                                    ],
                                  ),
                                ),
                              ),
                            BlocBuilder<HomeCubit, HomeState>(
                              builder: (context, state) {
                                if (state is GetJobsLoadingState) {
                                  return const Expanded(
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  );
                                } else if (state is GetJobsErrorState) {
                                  return const Expanded(
                                    child: Center(
                                      child: Icon(Icons.error, color: Colors.red),
                                    ),
                                  );
                                } else {
                                  return Expanded(
                                    child: ListView(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Suggested Job',
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Spacer(),
                                            Text(
                                              'View all',
                                              style:
                                                  TextStyle(fontSize: 10.sp, color: blue),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        SizedBox(
                                          height: 25.h,
                                          child: ListView.separated(
                                            scrollDirection: Axis.horizontal,
                                            itemCount:
                                                homeCubit.getJobsResponse.data!.length,
                                            itemBuilder: (context, index) {
                                              Color color1 = index % 2 == 0
                                                  ? const Color(0xff091A7A)
                                                  : const Color(0xffF4F4F5);
                                              Color color2 = index % 2 == 0
                                                  ? const Color(0xff2B3A8D)
                                                  : const Color(0xffD6E4FF);
                                              Color textColor = index % 2 == 0
                                                  ? Colors.white
                                                  : Colors.black;
                                              return SuggestedJobItem(
                                                color1: color1,
                                                color2: color2,
                                                jobData: homeCubit
                                                    .getJobsResponse.data![index],
                                                textColor: textColor,
                                              );
                                            },
                                            separatorBuilder:
                                                (BuildContext context, int index) {
                                              return SizedBox(
                                                width: 3.w,
                                              );
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Recent Job',
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Spacer(),
                                            Text(
                                              'View all',
                                              style:
                                                  TextStyle(fontSize: 10.sp, color: blue),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        SizedBox(
                                          height: 80.h,
                                          child: ListView.builder(
                                            physics: const NeverScrollableScrollPhysics(),
                                            itemCount:
                                                homeCubit.getJobsResponse.data!.length,
                                            itemBuilder: (context, index) {
                                              return RecentJobItem(
                                                jobData: homeCubit
                                                    .getJobsResponse.data![index],
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                            )
                          ],
                        )

          ),
        ),
      );
  }
}
