import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_finder/business_logic/apply_job_cubit/apply_job_cubit.dart';
import 'package:job_finder/presentation/style/colors.dart';
import 'package:sizer/sizer.dart';

class ApplyJob3 extends StatefulWidget {
  final ApplyJobCubit applyJobCubit;
  const ApplyJob3({super.key, required this.applyJobCubit});

  @override
  State<ApplyJob3> createState() => _ApplyJob3State();
}

class _ApplyJob3State extends State<ApplyJob3> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            child: Text(
              'Upload portfolio',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            'Fill in your bio data correctly',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 10.sp, color: Colors.grey[600]),
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            'Upload portfolio',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 2.h,
          ),
          Visibility(
            visible: widget.applyJobCubit.cvFileName!='',
            child: Container(
              height: 12.h,
              padding: EdgeInsets.all(5.sp),
              decoration: BoxDecoration(
                  border: Border.all(color: grey),
                  borderRadius: BorderRadius.circular(10.sp)),
              child: Row(
                children: [
                  SvgPicture.asset('assets/images/home_layout/pdf.svg'),
                  SizedBox(width: 2.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.h),
                          child: Text(
                            widget.applyJobCubit.cvFileName,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 10.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          'CV.pdf - ${widget.applyJobCubit.cvFileSize} bytes',
                          textAlign: TextAlign.start,
                          style:
                              TextStyle(fontSize: 8.sp, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        widget.applyJobCubit.pickCvFile();
                      },
                      icon: SvgPicture.asset(
                          'assets/images/home_layout/edit-2.svg')),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          if (widget.applyJobCubit.otherFilePath == '') {
                            widget.applyJobCubit.cvFilePath = '';
                          } else {
                            widget.applyJobCubit.cvFilePath =
                                widget.applyJobCubit.otherFilePath;
                            widget.applyJobCubit.cvFileName =
                                widget.applyJobCubit.otherFileName;
                            widget.applyJobCubit.cvFileSize =
                                widget.applyJobCubit.otherFileSize;
                            widget.applyJobCubit.otherFilePath = '';
                          }
                        });
                      },
                      icon: SvgPicture.asset(
                          'assets/images/home_layout/close-circle.svg')),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          if (widget.applyJobCubit.otherFilePath == '')
            InkWell(
                onTap: () {
                  if (widget.applyJobCubit.cvFilePath == '') {
                    widget.applyJobCubit.pickCvFile();
                  } else {
                    widget.applyJobCubit.pickOtherFile();
                  }
                },
                child: SvgPicture.asset(
                    'assets/images/home_layout/Upload document.svg'))
          else
            Container(
              height: 12.h,
              padding: EdgeInsets.all(5.sp),
              decoration: BoxDecoration(
                  border: Border.all(color: grey),
                  borderRadius: BorderRadius.circular(10.sp)),
              child: Row(
                children: [
                  SvgPicture.asset('assets/images/home_layout/pdf.svg'),
                  SizedBox(width: 2.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.h),
                          child: Text(
                            widget.applyJobCubit.otherFileName,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 10.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          'CV.pdf - ${widget.applyJobCubit.otherFileSize} bytes',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 8.sp, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        widget.applyJobCubit.pickOtherFile();
                      },
                      icon: SvgPicture.asset(
                          'assets/images/home_layout/edit-2.svg')),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          widget.applyJobCubit.otherFilePath = '';
                        });
                      },
                      icon: SvgPicture.asset(
                          'assets/images/home_layout/close-circle.svg')),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
