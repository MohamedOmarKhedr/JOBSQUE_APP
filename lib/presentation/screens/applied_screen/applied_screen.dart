import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder/business_logic/applied_cubit/applied_cubit.dart';
import 'package:job_finder/presentation/screens/applied_screen/active_screen.dart';
import 'package:job_finder/presentation/screens/applied_screen/rejected_screen.dart';
import 'package:sizer/sizer.dart';

import '../../style/colors.dart';
import '../../views/applied_screen/applied_item.dart';
import '../../views/applied_screen/applied_job_item_button.dart';
import '../../views/my_title.dart';

class AppliedScreen extends StatefulWidget {
  const AppliedScreen({super.key});

  @override
  State<AppliedScreen> createState() => _AppliedScreenState();
}

class _AppliedScreenState extends State<AppliedScreen> {

  late AppliedCubit appliedCubit;

  @override
  void didChangeDependencies() {
    appliedCubit = AppliedCubit.get(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
            title: Text(
              'Applied Job',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
            )),

        body: BlocBuilder<AppliedCubit, AppliedState>(
          builder: (context, state) {
            return Column(
              children: [
                Center(
                  child: Container(
                    height: 7.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                        color: grey, borderRadius: BorderRadius.circular(25.sp)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppliedJobItemButton(
                            appliedCubit: appliedCubit, thisIndex: 0),
                        AppliedJobItemButton(
                            appliedCubit: appliedCubit, thisIndex: 1),
                      ],
                    ),
                  ),
                ),
                if(appliedCubit.currentAppliedJobIndex==0)
                  Expanded(child: ActiveScreen(appliedCubit: appliedCubit))
                else if(appliedCubit.currentAppliedJobIndex==1)
                  const Expanded(child: RejectedScreen()),
              ],
            );
          },
        )
    );
  }
}
