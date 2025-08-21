import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:job_finder/business_logic/home_cubit/home_cubit.dart';
import 'package:job_finder/core/screens.dart';
import 'package:job_finder/data/models/finish_screen_model.dart';
import 'package:job_finder/presentation/views/job_type_item.dart';
import 'package:job_finder/presentation/widgets/my_button.dart';
import 'package:job_finder/presentation/widgets/my_job_text_field.dart';
import 'package:sizer/sizer.dart';

import '../style/colors.dart';

class JobFilterAlert extends StatefulWidget {
  final HomeCubit homeCubit;
  const JobFilterAlert({super.key, required this.homeCubit});

  @override
  State<JobFilterAlert> createState() => _JobFilterAlertState();
}

class _JobFilterAlertState extends State<JobFilterAlert> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _salaryController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is FilterJobsSuccessState) {
          if (widget.homeCubit.filterJobsResponse.data!.isEmpty) {
            FinishScreenModel finishScreenModel = FinishScreenModel(
              title: 'Search not found',
              subTitle:
                  'Try searching with different keywords so we can show you',
              imagePath: 'assets/images/home_layout/Search Ilustration.svg',
              onPressedIcon: (context) => Navigator.pop(context),
              isIconButton: true,
              buttonText: '',
              isButton: false,
            );

            Navigator.pushNamed(context, finishScreen,
                arguments: finishScreenModel);
          } else {
            Navigator.pushNamed(context, setFilterResultScreen,
                arguments: widget.homeCubit.filterJobsResponse);
          }
        }
      },
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.sp),
              topRight: Radius.circular(20.sp),
            ),
          ),
          height: 95.h,
          width: 100.w,
          child: Dialog(
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_sharp)),
                      Text(
                        'Set Filter',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: blue),
                      ),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              _nameController = TextEditingController(text: '');
                              _salaryController =
                                  TextEditingController(text: '');
                              _locationController =
                                  TextEditingController(text: '');
                            });
                          },
                          child: Text(
                            'Reset',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: SizedBox(
                        height: 80.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.h),
                              child: Text(
                                'Job title',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 12.sp, fontWeight: FontWeight.bold),
                              ),
                            ),
                            MyJobTextField(
                              prefixIcon: const Icon(Icons.work_outline_rounded),
                              hintText: 'Job title',
                              onChanged: (text) {
                                widget.homeCubit.jobName = text;
                              },
                              controller: _nameController,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.h),
                              child: Text(
                                'Location',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 12.sp, fontWeight: FontWeight.bold),
                              ),
                            ),
                            MyJobTextField(
                              controller: _locationController,
                              prefixIcon: const Icon(Icons.location_on_outlined),
                              hintText: 'Location',
                              onChanged: (text) {
                                widget.homeCubit.jobLocation = text;
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.h),
                              child: Text(
                                'Salary',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 12.sp, fontWeight: FontWeight.bold),
                              ),
                            ),
                            MyJobTextField(
                              controller: _salaryController,
                              prefixIcon: const Icon(Icons.attach_money),
                              hintText: '??K\$',
                              onChanged: (text) {
                                widget.homeCubit.jobSalary = text;
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.h),
                              child: Text(
                                'Job type',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12.sp, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const JobTypeItem(text: 'Full Time'),
                                SizedBox(
                                  width: 1.w,
                                ),
                                const JobTypeItem(text: 'Remote'),
                                SizedBox(
                                  width: 1.w,
                                ),
                                const JobTypeItem(text: 'Contact'),
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const JobTypeItem(text: 'Part Time'),
                                SizedBox(
                                  width: 1.w,
                                ),
                                const JobTypeItem(text: 'Onside'),
                                SizedBox(
                                  width: 1.w,
                                ),
                                const JobTypeItem(text: 'Inter Ship'),
                              ],
                            ),
                            const Spacer(),
                            MyButton(
                                onPressed: () {
                                  if (widget.homeCubit.jobLocation != '' ||
                                      widget.homeCubit.jobName != '' ||
                                      widget.homeCubit.jobSalary != '') {
                                    widget.homeCubit.filterJobs(
                                        location: widget.homeCubit.jobLocation,
                                        salary: widget.homeCubit.jobSalary,
                                        name: widget.homeCubit.jobName);
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "You must enter any data to contain result",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.sp);
                                  }
                                },
                                text: 'Show result'),
                          ],
                        ),
                      ),
                    ),
                  )
            
                  // Add more widgets as needed
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
