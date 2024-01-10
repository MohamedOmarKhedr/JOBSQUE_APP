
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder/core/my_cache_keys.dart';
import 'package:job_finder/data/local_data/my_cache.dart';
import 'package:job_finder/data/remote_data/requests/notification_request.dart';
import 'package:job_finder/data/remote_data/responses/get_jobs_response.dart';
import 'package:job_finder/data/remote_data/responses/notification_response.dart';

import '../../data/remote_data/requests/filter_jobs_request.dart';
import '../../data/remote_data/requests/get_jobs_request.dart';
import '../../data/remote_data/responses/filter_jobs_response.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);

  String jobName='';
  String jobLocation='';
  String jobSalary='';



  GetJobsResponse getJobsResponse = GetJobsResponse();
  NotificationResponse getNotificationsResponse =NotificationResponse();
  FilterJobsResponse filterJobsResponse = FilterJobsResponse();

  late bool isSavedClicked;



  void getJobs() {
    emit(GetJobsLoadingState());

    GetJobsRequest()
        .getJobsRequest(
      token: MyCache.getString(key: MyCacheKeys.token),
    )
        .then((value) {
      getJobsResponse = value;
      emit(GetJobsSuccessState());
    }).catchError((error) {
      emit(GetJobsErrorState());
    });
  }

  void filterJobs(
      {required String location,
      required String salary,
      required String name}) {
    emit(FilterJobsLoadingState());

    FilterJobsRequest()
        .filterJobsRequest(
      token: MyCache.getString(key: MyCacheKeys.token),
      location: location,
      salary: salary,
      name: name,
    )
        .then((value) {
      filterJobsResponse = value;
      emit(FilterJobsSuccessState());
    }).catchError((error) {
      emit(FilterJobsErrorState());
    });
  }



  void getNotifications() {
    emit(GetNotificationLoadingState());

    NotificationRequest()
        .notificationRequest(
      token: MyCache.getString(key: MyCacheKeys.token),
    )
        .then((value) {
      getNotificationsResponse = value;
      emit(GetNotificationSuccessState());
    }).catchError((error) {
      emit(GetNotificationErrorState());
    });
  }



}
