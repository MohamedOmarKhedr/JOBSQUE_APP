import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder/business_logic/profile_cubit/profile_cubit.dart';
import 'package:job_finder/core/my_cache_keys.dart';
import 'package:job_finder/core/screens.dart';
import 'package:job_finder/data/local_data/my_cache.dart';
import 'dart:math' as math;

import 'package:sizer/sizer.dart';

import '../../../style/colors.dart';
import '../../../views/back_arrow_button.dart';
import '../../../views/profile_screen/complete_profile_item.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  late ProfileCubit profileCubit;
  @override
  void didChangeDependencies() {
    profileCubit = ProfileCubit.get(context)..isPortfolioDone();

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
              'Complete Profile',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    children: [
                      CustomPaint(
                        painter: CirclePainter(
                            progressPercentage: 1,
                            color: const Color(0xffE5E7EB)),
                        child: SizedBox(
                          width: 14.h,
                          height: 14.h,
                        ),
                      ),
                      CustomPaint(
                        painter: CirclePainter(
                            progressPercentage:
                                profileCubit.progressPercentage / 100,
                            color: blue),
                        child: SizedBox(
                          width: 14.h,
                          height: 14.h,
                          child: Center(
                              child: Text(
                            '${profileCubit.progressPercentage}%',
                            style: TextStyle(
                                color: blue,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
                Center(
                  child: Visibility(
                    visible: profileCubit.completedCount != 4,
                    replacement: Text(
                      'Completed!',
                      style: TextStyle(
                          color: blue,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    child: Text(
                      '${profileCubit.completedCount}/4 Completed',
                      style: TextStyle(
                          color: blue,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  'Complete your profile before applying for a job',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(height: 3.h),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            if (index == 0) {
                              Navigator.pushNamed(context, editProfileScreen,
                                  arguments: 'Personal Details');
                            } else if (index == 1) {
                              Navigator.pushNamed(context, educationScreen);
                            } else if (index == 2) {
                              Navigator.pushNamed(context, experienceScreen);
                            } else if (index == 3) {
                              Navigator.pushNamed(context, portfolioScreen);
                            }
                          },
                          child: CompleteProfileItem(
                            isDone: profileCubit.completeProfileData[index]
                                ['isDone'],
                            title: profileCubit.completeProfileData[index]
                                ['title'],
                            subTitle: profileCubit.completeProfileData[index]
                                ['subTitle'],
                            index: index,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 2.h);
                      },
                      itemCount: profileCubit.completeProfileData.length),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class CirclePainter extends CustomPainter {
  final double progressPercentage;
  final Color color;
  CirclePainter({
    required this.progressPercentage,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint outerCirclePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    final double radius = size.width / 2;

    // حساب الزاوية البدائية والزاوية النهائية بناءً على نسبة التقدم
    final double startAngle = -math.pi / 2;
    final double endAngle = startAngle + (2 * math.pi * progressPercentage);

    // رسم الدائرة الخارجية
    canvas.drawArc(
      Rect.fromCircle(center: Offset(radius, radius), radius: radius),
      startAngle,
      endAngle - startAngle,
      false,
      outerCirclePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
