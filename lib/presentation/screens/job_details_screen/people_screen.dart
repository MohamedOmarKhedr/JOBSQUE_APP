import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_finder/presentation/style/colors.dart';
import 'package:job_finder/presentation/views/job_people_item.dart';
import 'package:sizer/sizer.dart';

import '../../../data/remote_data/responses/get_jobs_response.dart';

class PeopleScreen extends StatelessWidget {
  final JobData jobData;
  PeopleScreen({super.key, required this.jobData});

  List<Map<String, String>> peoples = [
    {
      'name': 'Dimas Adi Saputro',
      'imagePath': 'assets/images/home_layout/Dimas Profile.png',
      'job': 'Senior UI/UX Designer at Amit',
      'years': '5 Years'
    },
    {
      'name': 'Syahrul Ramadhani',
      'imagePath': 'assets/images/home_layout/Syahrul Profile.png',
      'job': 'Senior UI/UX Designer at Amit',
      'years': '5 Years',
    },
    {
      'name': 'Farrel Daniswara',
      'imagePath': 'assets/images/home_layout/Farrel Profile.png',
      'job': 'Senior UI/UX Designer at Amit',
      'years': '4 Years',
    },
    {
      'name': 'Azzahra Farrelika',
      'imagePath': 'assets/images/home_layout/Azzahra Profile.png',
      'job': 'UI/UX Designer at Amit',
      'years': '4 Years',
    },
    {
      'name': 'Ferdi Saputra',
      'imagePath': 'assets/images/home_layout/Ferdi Profile.png',
      'job': 'UI/UX Designer at Amit',
      'years': '3 Years',
    },
    {
      'name': 'Dindra Deesmipian',
      'imagePath': 'assets/images/home_layout/Dindra Profile.png',
      'job': 'UI/UX Designer at Amit',
      'years': '3 Years',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    child: Text(
                      '6 Employees For',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                  Text(
                    'UI/UX Design',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 10.sp, color: Colors.grey[600]),
                  ),
                ],
              ),
              const Spacer(),
              SvgPicture.asset('assets/images/home_layout/Choose.svg'),
            ],
          ),
          SizedBox(height: 2.h,),
          Expanded(
            child: Padding(
              padding:  EdgeInsets.only(bottom: 6.h),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return JobPeopleItem(personData: peoples[index]);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    height: 2.h,
                    thickness: .5.sp,
                    color: grey,
                  );
                },
                itemCount: peoples.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
