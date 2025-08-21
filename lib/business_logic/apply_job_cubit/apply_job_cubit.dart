import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:job_finder/core/screens.dart';
import 'package:job_finder/data/models/finish_screen_model.dart';
import 'package:job_finder/data/remote_data/responses/apply_job_response.dart';
import 'package:sizer/sizer.dart';
import '../../core/my_cache_keys.dart';
import '../../data/local_data/my_cache.dart';
import '../../data/remote_data/requests/apply_job_request.dart';
import '../../presentation/views/back_arrow_button.dart';
part 'apply_job_state.dart';

class ApplyJobCubit extends Cubit<ApplyJobState> {
  ApplyJobCubit() : super(ApplyJobInitial());

  static ApplyJobCubit get(context) => BlocProvider.of<ApplyJobCubit>(context);

  int currentJobDetailIndex = 0;

  List<String> jobDetailTitles = ['Description', 'Company', 'People'];

  void changeJobDetailScreensIndex(int index) {
    currentJobDetailIndex = index;
    emit(ChangeJobDetailScreensIndexState());
  }

  int currentApplyJobIndex = 0;

  int indexTypeJob = -1;

  List<String> applyJobImagePath = [
    'assets/images/home_layout/Step.svg',
    'assets/images/home_layout/Step2.svg',
    'assets/images/home_layout/Step3.svg'
  ];

  void changeApplyJobScreensIndex(int index) {
    currentApplyJobIndex = index;
    emit(ChangeApplyJobScreensIndexState());
  }

  String userName = '';
  String email = '';
  String mobile = '';
  String workType = '';
  File cvFile = File('');
  String cvFilePath = '';
  String cvFileName = '';
  int cvFileSize = 0;
  File otherFile = File('');
  String otherFilePath = '';
  String otherFileName = '';
  int otherFileSize = 0;

  ApplyJobResponse applyJobResponse = ApplyJobResponse();

  Future<void> pickCvFile() async {
    emit(PickCvFileLoadingState());
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      cvFile = File(result.files.single.path!);
      cvFilePath = result.files.single.path!;
      cvFileName = result.files.single.name;
      cvFileSize = result.files.single.size;

      if (kDebugMode) {
        print('CV File Path: $cvFilePath');
      }
      if (kDebugMode) {
        print('Cv File Name: $cvFileName');
      }
      if (kDebugMode) {
        print('CV File Size: $cvFileSize bytes');
      }
      emit(PickCvFileSuccessState());
    } else {
      // User canceled the file picker
      if (kDebugMode) {
        print('Cv File picking canceled.');
      }
      emit(PickCvFileErrorState());
    }
  }

  Future<void> pickOtherFile() async {
    emit(PickOtherFileLoadingState());
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      otherFile = File(result.files.single.path!);
      otherFilePath = result.files.single.path!;
      otherFileName = result.files.single.name;
      otherFileSize = result.files.single.size;

      if (kDebugMode) {
        print('CV File Path: $otherFilePath');
      }
      if (kDebugMode) {
        print('Cv File Name: $otherFileName');
      }
      if (kDebugMode) {
        print('CV File Size: $otherFileSize bytes');
      }
      emit(PickOtherFileSuccessState());
    } else {
      // User canceled the file picker
      if (kDebugMode) {
        print('Cv File picking canceled.');
      }
      emit(PickOtherFileErrorState());
    }
  }

  void applyJob({
    required String cvFilePath,
    required String cvFileName,
    required String email,
    required String name,
    required String mobile,
    required String workType,
    required String otherFilePath,
    required String otherFileName,
    required String jobsId,
  }) {
    emit(ApplyJobLoadingState());

    ApplyJobRequest()
        .applyJobRequest(
      token: MyCache.getString(key: MyCacheKeys.token),
      name: name,
      email: email,
      mobile: mobile,
      workType: workType,
      jobsId: jobsId,
      userId: MyCache.getInt(key: MyCacheKeys.userId).toString(),
      cvFilePath: cvFilePath,
      cvFileName: cvFileName,
      otherFilePath: otherFilePath,
      otherFileName: otherFileName,
    )
        .then((value) {
      applyJobResponse = value;
      emit(ApplyJobSuccessState());
    }).catchError((error) {
      emit(ApplyJobErrorState());
    });
  }

  void onApplyJobButton(int jobId) {
    if (cvFilePath != '') {
      if (cvFilePath != '' && otherFilePath == '') {
        otherFilePath = cvFilePath;
        otherFileName = cvFileName;
        otherFileSize = cvFileSize;
      }
      applyJob(
          email: email,
          name: userName,
          mobile: mobile,
          workType: workType,
          jobsId: jobId.toString(),
          cvFilePath: cvFilePath,
          cvFileName: cvFileName,
          otherFilePath: otherFilePath,
          otherFileName: otherFileName);
    } else {
      Fluttertoast.showToast(
          msg: "You must enter your cv file",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.sp);
    }
    emit(OnApplyJobButtonState());
  }

  void afterApplyJob({required String compName,required String imagePath,required BuildContext context}) {

    MyCache.putString(key: MyCacheKeys.jobCompName, value: compName);
    MyCache.putString(key: MyCacheKeys.jobImagePath, value: imagePath);

    FinishScreenModel finishScreenModel = FinishScreenModel(
        title: 'Your data has been successfully sent',
        subTitle: 'You will get a message from our team, about the announcement of employee acceptance',
        imagePath: 'assets/images/home_layout/Data Ilustration.svg',
        isButton: true,
        isIconButton: true,
        onPressedIcon: (context) {
          BackArrowButton(context: context);
        },
        onPressed: (context) {
          Navigator.pushNamedAndRemoveUntil(
              context, homeLayoutScreen, (route) => false);
        },
        appBarTitle: 'Apply Job',
        buttonText: 'Back To Home');

    Navigator.pushNamed(context, finishScreen,arguments:finishScreenModel);

    emit(AfterApplyJobState());
  }
}
