import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_finder/business_logic/home_cubit/home_cubit.dart';
import 'package:job_finder/presentation/style/colors.dart';
import 'package:job_finder/presentation/views/filter_jobs_item.dart';
import 'package:sizer/sizer.dart';

import '../../../data/remote_data/responses/filter_jobs_response.dart';

class SetFilterResultScreen extends StatefulWidget {
  final FilterJobsResponse filterJobsResponse;
  const SetFilterResultScreen({super.key, required this.filterJobsResponse});

  @override
  State<SetFilterResultScreen> createState() => _SetFilterResultScreenState();
}

class _SetFilterResultScreenState extends State<SetFilterResultScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: SvgPicture.asset(
                  'assets/images/home_layout/arrow-left.svg',
                  height: 3.h,
                  width: 8.w,
                )),
            title: Text(
              'Set Filter Result',
              style: TextStyle(
                  fontSize: 16.sp, fontWeight: FontWeight.bold, color: blue),
            ),
          ),
          body: Column(
            children: [
              Container(
                height: 7.h,
                width: double.infinity,
                color: const Color(0xffF4F4F5),
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                child: Text(
                  'Featuring ${widget.filterJobsResponse.data!.length} jobs',
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  child: ListView.separated(
                    itemCount: widget.filterJobsResponse.data!.length,
                    itemBuilder: (context, index) {
                      return FilterJobItem(
                          filterJobData:
                              widget.filterJobsResponse.data![index],);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        height: 2.h,
                        thickness: 1,
                        color: grey,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
