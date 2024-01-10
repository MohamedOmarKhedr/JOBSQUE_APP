import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder/business_logic/home_cubit/home_cubit.dart';
import 'package:job_finder/core/my_cache_keys.dart';
import 'package:job_finder/data/local_data/my_cache.dart';
import 'package:job_finder/data/models/finish_screen_model.dart';
import 'package:job_finder/presentation/views/finish_screen.dart';
import 'package:sizer/sizer.dart';

import '../../style/colors.dart';
import '../../views/back_arrow_button.dart';
import '../../views/saved_screen/saved_item.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  late HomeCubit homeCubit;
  FinishScreenModel finishScreenModel = FinishScreenModel(
      title: 'Nothing has been saved yet',
      subTitle: 'Press the star icon on the job you want to save.',
      imagePath: 'assets/images/home_layout/Saved Ilustration.svg',
  );
  @override
  void didChangeDependencies() {
    homeCubit = HomeCubit.get(context)..getJobs();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Saved',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is GetJobsLoadingState) {
            return SizedBox(
              height: 80.h,
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.grey,
                ),
              ),
            );
          } else if (state is GetJobsErrorState) {
            return SizedBox(
              height: 80.h,
              child: const Center(
                child: Icon(Icons.error, color: Colors.red),
              ),
            );
          } else {
            return Visibility(
              visible: MyCache.getStringList(key: MyCacheKeys.jobsIdSavedList)
                  .isNotEmpty,
              replacement: FinishScreen(finishScreenModel: finishScreenModel,),
              child: Column(
                children: [
                  Container(
                    height: 7.h,
                    width: double.infinity,
                    color: const Color(0xffF4F4F5),
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                    child: Text(
                      '${MyCache.getStringList(key: MyCacheKeys.jobsIdSavedList).length} Jobs Saved',
                      style:
                          TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
                    ),
                  ),
                  Flexible(
                    child: ListView.builder(
                        itemBuilder: (context, index) {
                          List<String> jobsId = MyCache.getStringList(
                              key: MyCacheKeys.jobsIdSavedList);
                            return Visibility(
                              visible: jobsId.contains(homeCubit
                                  .getJobsResponse.data![index].id
                                  .toString()),
                              child: SavedItem(
                                jobData: homeCubit.getJobsResponse.data![index],
                              ),
                            );

                        },
                        itemCount: homeCubit.getJobsResponse.data!.length),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
