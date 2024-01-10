import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_finder/business_logic/home_cubit/home_cubit.dart';
import 'package:job_finder/presentation/views/back_arrow_button.dart';
import 'package:job_finder/presentation/views/search_screen/recent_searches.dart';
import 'package:job_finder/presentation/views/search_screen/search_text_field.dart';
import 'package:sizer/sizer.dart';

import '../../style/colors.dart';
import '../../views/job_filter_alert.dart';
import '../../views/search_screen/popular_searches.dart';
import '../../views/search_screen/remote_type_button_sheet.dart';
import '../../views/search_screen/search_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController(text: '');
  String text = '';
  List<String> jobs = [
    'Junior UI Designer',
    'Junior UX Designer',
    'Product Designer',
    'Product Manager',
    'UI/UX Designer',
    'Front-End Developer'
  ];
  List<String> imagePaths = [
    'assets/images/home_layout/setting-4.svg',
    'assets/images/home_layout/Button.svg',
    'assets/images/home_layout/Button2.svg',
    'assets/images/home_layout/Button3.svg',
    'assets/images/home_layout/Button4.svg'
  ];

  List<Map<String, String>> jobsSearch = [
    {
      'logo': 'assets/images/home_layout/Twitter Logo.png',
      'jobName': 'UI/UX Designer',
      'address': 'Twitter • Jakarta, Indonesia',
      'salary': '10'
    },
    {
      'logo': 'assets/images/home_layout/Spectrum Logo.png',
      'jobName': 'UI/UX Designer',
      'address': 'Spectrum • Jakarta, Indonesia',
      'salary': '10'
    },
    {
      'logo': 'assets/images/home_layout/VK Logo.png',
      'jobName': 'Senior UI Designer',
      'address': 'VK • Yogyakarta, Indonesia',
      'salary': '12'
    },
    {
      'logo': 'assets/images/home_layout/Invision Logo.png',
      'jobName': 'Junior UI Designer',
      'address': 'Invision • Jakarta, Indonesia',
      'salary': '9'
    },
    {
      'logo': 'assets/images/home_layout/Behance Logo.png',
      'jobName': 'Junior UI Designer',
      'address': 'Behance • Surakarta, Indonesia',
      'salary': '12'
    },
  ];

  late HomeCubit homeCubit;
  @override
  void didChangeDependencies() {
    homeCubit = HomeCubit.get(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackArrowButton(
          context: context,
        ),
        actions: [
          SearchTextField(
            controller: controller,
            onChanged: (text) {
              setState(() {
                this.text = text;

              });
            },
          )
        ],
      ),
      body: text == ''
          ? ListView(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  height: 7.h,
                  width: double.infinity,
                  color: const Color(0xffF4F4F5),
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  child: Text(
                    'Recent Searches',
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: jobs.length,
                    itemBuilder: (context, index) {
                      return RecentSearches(recentSearch: jobs[index]);
                    },
                  ),
                ),
                Container(
                  height: 7.h,
                  width: double.infinity,
                  color: const Color(0xffF4F4F5),
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  child: Text(
                    'Popular Searches',
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                  constraints:
                      BoxConstraints(minHeight: 5.h, maxHeight: 40.h),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: jobs.length,
                    itemBuilder: (context, index) {
                      return PopularSearches(popularSearch: jobs[index]);
                    },
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Container(
                  height: 6.h,
                  margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                  padding: EdgeInsets.all(1.sp),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            if (index == 0) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return JobFilterAlert(
                                    homeCubit: homeCubit,
                                  );
                                },
                              );
                            }
                            else if(index == 1){
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return const RemoteTypeButtonSheet();
                                },
                              );
                            }
                          },
                          child: SvgPicture.asset(imagePaths[index]));
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: 2.w,
                      );
                    },
                    itemCount: imagePaths.length,
                  ),
                ),
                Container(
                  height: 7.h,
                  width: double.infinity,
                  color: const Color(0xffF4F4F5),
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  child: Text(
                    'Featuring 5 jobs',
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Expanded(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(vertical: 2.h,horizontal: 2.h),
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return SearchItem(
                            jobData: jobsSearch[index],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            thickness: .5.sp,
                            color: grey,
                            height: 1.h,
                          );
                        },
                        itemCount: jobsSearch.length),
                  ),
                )
              ],
            ),
    );
  }
}
