import 'package:flutter/material.dart';
import 'package:job_finder/business_logic/applied_cubit/applied_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../style/colors.dart';
import '../../views/applied_screen/applied_item.dart';
import '../../views/my_title.dart';

class ActiveScreen extends StatelessWidget {
  final AppliedCubit appliedCubit;
  const ActiveScreen({super.key, required this.appliedCubit});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const MyTitle(
            text: '3 jobs',
          ),
          Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.h),
                    child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return AppliedItem(
                appliedJobData: appliedCubit.appliedJobsData[index],
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: grey,
                height: 2.h,
                thickness: .5.sp,
              );
            },
            itemCount: appliedCubit.appliedJobsData.length),
                  ),
        ],
      ),
    );
  }
}
