import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_finder/core/screens.dart';
import 'package:sizer/sizer.dart';

import '../../../core/my_cache_keys.dart';
import '../../../data/local_data/my_cache.dart';
import '../../../data/remote_data/responses/get_jobs_response.dart';

class SavedMoreSheetButton extends StatelessWidget {
  final JobData jobData;
  const SavedMoreSheetButton({super.key, required this.jobData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 2.h,horizontal: 4.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/home_layout/Vector 68.svg'),
          SizedBox(height: 2.h),
          InkWell(onTap:(){
            Navigator.pushNamed(context, applyJobScreen,arguments: jobData);
          },child: SvgPicture.asset('assets/images/home_layout/Apply.svg')),
          SizedBox(height: 2.h),
          InkWell(onTap:(){},child: SvgPicture.asset('assets/images/home_layout/Share.svg')),
          SizedBox(height: 2.h),
          InkWell(onTap:(){
            List<String> jobsIdSaved = MyCache.getStringList(key: MyCacheKeys.jobsIdSavedList);
            if (jobsIdSaved.contains(jobData.id.toString())) {
              jobsIdSaved.remove(jobData.id.toString());
              MyCache.putStringList(key: MyCacheKeys.jobsIdSavedList, value: jobsIdSaved);
              if (kDebugMode) {
                print(MyCache.getStringList(key: MyCacheKeys.jobsIdSavedList));
              }
            }
            Navigator.pushNamedAndRemoveUntil(context, homeLayoutScreen, (route) => false,);
          },child: SvgPicture.asset('assets/images/home_layout/Cancel.svg')),
          SizedBox(height: 2.h),




        ],

      ),
    );
  }
}
