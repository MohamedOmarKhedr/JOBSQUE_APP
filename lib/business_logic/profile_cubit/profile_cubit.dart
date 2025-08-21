import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:job_finder/core/my_cache_keys.dart';
import 'package:job_finder/data/local_data/my_cache.dart';
import 'package:sizer/sizer.dart';

import '../../data/remote_data/requests/update_user_data_request.dart';
import '../../data/remote_data/responses/update_user_data_response.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of<ProfileCubit>(context);

  List<Map<String, dynamic>> profileGeneralData = [
    {
      'imagePath': 'assets/images/home_layout/Edit Profile.svg',
      'title': 'Edit Profile'
    },
    {
      'imagePath': 'assets/images/home_layout/Portfolio.svg',
      'title': 'Portfolio'
    },
    {
      'imagePath': 'assets/images/home_layout/Language.svg',
      'title': 'Language'
    },
    {
      'imagePath': 'assets/images/home_layout/Notification Setting.svg',
      'title': 'Notification'
    },
    {
      'imagePath': 'assets/images/home_layout/Login and security.svg',
      'title': 'Login and security'
    },
  ];
  List<String> profileOtherTitle = [
    'Accessibility',
    'Help Center',
    'Terms & Conditions',
    'Privacy Policy',
    'Complete Profile'
  ];

  File fileImage = File(MyCache.getString(key: MyCacheKeys.profileImagePath));
  String imagePath = '';

  Future<void> pickProfileImage() async {
    emit(PickProfileImageLoadingState());
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );
    if (result != null) {
      MyCache.putString(
          key: MyCacheKeys.profileImagePath, value: result.files.single.path!);
      fileImage = File(MyCache.getString(key: MyCacheKeys.profileImagePath));
      emit(PickProfileImageSuccessfulState());
    } else {
      emit(PickProfileImageErrorState());
    }
  }

  String profileName = MyCache.getString(key: MyCacheKeys.userName);
  String profileBio = MyCache.getString(key: MyCacheKeys.profileBio);
  String profileAddress = MyCache.getString(key: MyCacheKeys.profileAddress);
  String profilePhoneNumber =
      MyCache.getString(key: MyCacheKeys.profilePhoneNumber);

  File portfolioFile = File('');
  String portfolioPath = '';
  String portfolioName = '';
  int portfolioSize = 0;

  Future<void> pickPortfolioFile() async {
    emit(PickPortfolioFileLoadingState());
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      portfolioFile = File(result.files.single.path!);
      portfolioPath = result.files.single.path!;
      portfolioName = result.files.single.name;
      portfolioSize = result.files.single.size;

      if (kDebugMode) {
        print('CV File Path: $portfolioPath');
      }
      if (kDebugMode) {
        print('Cv File Name: $portfolioName');
      }
      if (kDebugMode) {
        print('CV File Size: $portfolioSize bytes');
      }
      emit(PickPortfolioFileSuccessfulState());
    } else {
      // User canceled the file picker
      if (kDebugMode) {
        print('Cv File picking canceled.');
      }
      emit(PickPortfolioFileErrorState());
    }
  }

  void removePortfolio(index) {
    List<String> portfoliosNamesList =
        MyCache.getStringList(key: MyCacheKeys.portfoliosNamesList);
    portfoliosNamesList.removeAt(index);
    MyCache.putStringList(
        key: MyCacheKeys.portfoliosNamesList, value: portfoliosNamesList);
    List<String> portfoliosSizesList =
        MyCache.getStringList(key: MyCacheKeys.portfoliosSizesList);
    portfoliosSizesList.removeAt(index);
    MyCache.putStringList(
        key: MyCacheKeys.portfoliosSizesList, value: portfoliosSizesList);
    emit(RemovePortfolioState());
  }

  Future<void> editPortfolio(index) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      portfolioName = result.files.single.name;
      portfolioSize = result.files.single.size;
    }
    if (portfolioSize != 0 && portfolioName != '') {
      List<String> portfoliosNamesList =
          MyCache.getStringList(key: MyCacheKeys.portfoliosNamesList);
      portfoliosNamesList[index] = portfolioName;
      MyCache.putStringList(
          key: MyCacheKeys.portfoliosNamesList, value: portfoliosNamesList);
      List<String> portfoliosSizesList =
          MyCache.getStringList(key: MyCacheKeys.portfoliosSizesList);
      portfoliosSizesList[index] = portfolioSize.toString();
      MyCache.putStringList(
          key: MyCacheKeys.portfoliosSizesList, value: portfoliosSizesList);
      emit(EditPortfolioState());
    }
  }

  UpdateUserDataResponse updateUserDataResponse = UpdateUserDataResponse();
  String oldPassword ='';
  String newPassword ='';
  String newPassword2 ='';

  void postUpdateUserData(
      {required String name, required String password}) {
    emit(UpdateUserDataLoadingState());

    UpdateUserDataRequest()
        .updateUserDataRequest(name: name, password: password, token: MyCache.getString(key: MyCacheKeys.token),)
        .then((value) {
      updateUserDataResponse = value;
      emit(UpdateUserDataSuccessState());
    }).catchError((error) {
      emit(UpdateUserDataErrorState());
    });
  }

  void confirmUpdatePassword() {
    if(oldPassword!=MyCache.getString(key: MyCacheKeys.password)){
      Fluttertoast.showToast(
          msg: "You must enter the old password correctly",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 14.sp);
    }
    else if (newPassword.length >= 8 && newPassword == newPassword2 ) {
      postUpdateUserData(name: MyCache.getString(key: MyCacheKeys.userName), password: newPassword);
    } else if (newPassword.length < 8){
      Fluttertoast.showToast(
          msg: "Password must be at least 8 characters",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 14.sp);
    } else{
      Fluttertoast.showToast(
          msg: "Both password must match",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 14.sp);
    }
  }

  // complete profile screen
  int completedCount = 0;
  int progressPercentage = 0;
  void completedCountMethod(){
    completedCount = 0;
    if(MyCache.getBool(key: MyCacheKeys.isPersonalDetailsDone)){
      completedCount++;
    }
    if(MyCache.getBool(key: MyCacheKeys.isEducationDone)){
      completedCount++;
    }
    if(MyCache.getBool(key: MyCacheKeys.isExperienceDone)){
      completedCount++;
    }
    if(MyCache.getBool(key: MyCacheKeys.isPortfolioDone)){
      completedCount++;
    }
    progressPercentage=completedCount*25;
  }

  List<Map> completeProfileData = [
    {
      'title': 'Personal Details',
      'subTitle': 'Full name, email, phone number, and your address',
      'isDone': MyCache.getBool(key: MyCacheKeys.isPersonalDetailsDone)
    },
    {
      'title': 'Education',
      'subTitle':
      'Enter your educational history to be considered by the recruiter',
      'isDone': MyCache.getBool(key: MyCacheKeys.isEducationDone)
    },
    {
      'title': 'Experience',
      'subTitle':
      'Enter your work experience to be considered by the recruiter',
      'isDone': MyCache.getBool(key: MyCacheKeys.isExperienceDone)
    },
    {
      'title': 'Portfolio',
      'subTitle': 'Create your portfolio. Applying for various types of jobs is easier.',
      'isDone': MyCache.getBool(key: MyCacheKeys.isPortfolioDone)
    },
  ];

  void isPortfolioDone(){
    if(MyCache.getStringList(key: MyCacheKeys.portfoliosNamesList).isNotEmpty) {
      MyCache.putBool(key: MyCacheKeys.isPortfolioDone, value: true);
    } else {
      MyCache.putBool(key: MyCacheKeys.isPortfolioDone, value: false);
    }
    completeProfileData[3]['isDone']=MyCache.getBool(key: MyCacheKeys.isPortfolioDone);
    completedCountMethod();
    emit(IsPortfolioDoneState());
  }

  void isPersonalDetailsDone(){
    if(profileName!=''&&profileBio!=''&&profileAddress!=''&&profilePhoneNumber!=''){
      MyCache.putBool(
          key: MyCacheKeys.isPersonalDetailsDone,
          value: true);
    }else{
      MyCache.putBool(
          key: MyCacheKeys.isPersonalDetailsDone,
          value: false);
    }
    completeProfileData[0]['isDone']=MyCache.getBool(key: MyCacheKeys.isPersonalDetailsDone);
    completedCountMethod();
    emit(IsPersonalDetailsDoneState());
  }

  //Education Screen

  String educationUniversity=MyCache.getString(key: MyCacheKeys.educationUniversity);
  String educationTitle=MyCache.getString(key: MyCacheKeys.educationTitle);
  String educationStartYear=MyCache.getString(key: MyCacheKeys.educationStartYear);
  String educationEndYear=MyCache.getString(key: MyCacheKeys.educationEndYear);

  void isEducationDone(){
    if(educationUniversity!=''&&educationTitle!=''&&educationStartYear!=''&&educationEndYear!=''){
      MyCache.putBool(
          key: MyCacheKeys.isEducationDone,
          value: true);
    }else{
      MyCache.putBool(
          key: MyCacheKeys.isEducationDone,
          value: false);
    }
    completeProfileData[1]['isDone']=MyCache.getBool(key: MyCacheKeys.isEducationDone);
    completedCountMethod();
    emit(IsEducationDoneState());
  }


  //Education Screen

  String experiencePosition=MyCache.getString(key: MyCacheKeys.experiencePosition);
  String experienceWorkType=MyCache.getString(key: MyCacheKeys.experienceWorkType);
  String experienceCompanyName=MyCache.getString(key: MyCacheKeys.experienceCompanyName);
  String experienceLocation=MyCache.getString(key: MyCacheKeys.experienceLocation);
  String experienceStartYear=MyCache.getString(key: MyCacheKeys.experienceStartYear);


  void isExperienceDone(){
    if(experiencePosition!=''&&experienceWorkType!=''&&experienceCompanyName!=''&&experienceLocation!=''&&experienceStartYear!=''){
      MyCache.putBool(
          key: MyCacheKeys.isExperienceDone,
          value: true);

    }else{
      MyCache.putBool(
          key: MyCacheKeys.isExperienceDone,
          value: false);
    }
    completeProfileData[2]['isDone']=MyCache.getBool(key: MyCacheKeys.isExperienceDone);
    completedCountMethod();
    emit(IsExperienceDoneState());
  }

  //after logout

  void afterLogoutSuccess(){
    MyCache.putString(key: MyCacheKeys.jobCompName, value: '');
    MyCache.putString(key: MyCacheKeys.jobImagePath, value: '');
    MyCache.putStringList(key: MyCacheKeys.jobsIdSavedList, value: []);
    MyCache.putString(key: MyCacheKeys.profileImagePath, value: '');
    MyCache.putString(key: MyCacheKeys.profileBio, value: '');
    MyCache.putString(key: MyCacheKeys.profileAddress, value: '');
    MyCache.putString(key: MyCacheKeys.profilePhoneNumber, value: '');
    MyCache.putStringList(key: MyCacheKeys.portfoliosNamesList, value: []);
    MyCache.putStringList(key: MyCacheKeys.portfoliosSizesList, value: []);
    MyCache.putInt(key: MyCacheKeys.languageIndex, value: 0);
    MyCache.putBool(key: MyCacheKeys.forResetPassword, value: false);
    MyCache.putBool(key: MyCacheKeys.isTwoStepEnable, value: false);
    MyCache.putBool(key: MyCacheKeys.isTwoStepVerify, value: false);
    MyCache.putBool(key: MyCacheKeys.isPersonalDetailsDone, value: false);
    MyCache.putBool(key: MyCacheKeys.isEducationDone, value: false);
    MyCache.putBool(key: MyCacheKeys.isExperienceDone, value: false);
    MyCache.putBool(key: MyCacheKeys.isPortfolioDone, value: false);
    MyCache.putString(key: MyCacheKeys.educationUniversity, value: '');
    MyCache.putString(key: MyCacheKeys.educationTitle, value: '');
    MyCache.putString(key: MyCacheKeys.educationStartYear, value: '');
    MyCache.putString(key: MyCacheKeys.educationEndYear, value: '');
    MyCache.putString(key: MyCacheKeys.experiencePosition, value: '');
    MyCache.putString(key: MyCacheKeys.experienceWorkType, value: '');
    MyCache.putString(key: MyCacheKeys.experienceCompanyName, value: '');
    MyCache.putString(key: MyCacheKeys.experienceLocation, value: '');
    MyCache.putString(key: MyCacheKeys.experienceStartYear, value: '');
    emit(AfterLogoutSuccessState());
  }


}
