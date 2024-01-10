import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder/core/screens.dart';

import '../../core/my_cache_keys.dart';
import '../../data/local_data/my_cache.dart';
import '../../data/models/finish_screen_model.dart';
import '../../data/remote_data/requests/register_request.dart';
import '../../data/remote_data/responses/register_response.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of<RegisterCubit>(context);

  RegisterResponse registerResponse = RegisterResponse();

  String message = 'Password must be at least 8 character';
  Color messageColor = Colors.grey;
  String name = '';
  String email = '';
  String password = '';
  bool passwordError = false;

  List<Map<String, dynamic>> jobs = [
    {
      'imagePath': 'assets/images/uiux.svg',
      'text': 'UI/UX Designer',
      'isClicked': false
    },
    {
      'imagePath': 'assets/images/Ilustrator Category .svg',
      'text': 'Ilustrator Designer',
      'isClicked': false
    },
    {
      'imagePath': 'assets/images/Developer Category.svg',
      'text': 'Developer',
      'isClicked': false
    },
    {
      'imagePath': 'assets/images/Management Category.svg',
      'text': 'Management',
      'isClicked': false
    },
    {
      'imagePath': 'assets/images/Information technology category.svg',
      'text': 'Information Technology',
      'isClicked': false
    },
    {
      'imagePath': 'assets/images/Research and Analytics category.svg',
      'text': 'Research and Analytics',
      'isClicked': false
    },
  ];

  List<Map<String, dynamic>> countries = [
    {
      'imagePath': 'assets/images/United States.png',
      'text': 'United States',
      'isClicked': false
    },
    {
      'imagePath': 'assets/images/Malaysia.png',
      'text': 'Malaysia',
      'isClicked': false
    },
    {
      'imagePath': 'assets/images/Singapore.png',
      'text': 'Singapore',
      'isClicked': false
    },
    {
      'imagePath': 'assets/images/Indonesia.png',
      'text': 'Indonesia',
      'isClicked': false
    },
    {
      'imagePath': 'assets/images/Philiphines.png',
      'text': 'Philippines',
      'isClicked': false
    },
    {
      'imagePath': 'assets/images/Polandia.png',
      'text': 'Poladian',
      'isClicked': false
    },
    {
      'imagePath': 'assets/images/India.png',
      'text': 'India',
      'isClicked': false
    },
    {
      'imagePath': 'assets/images/Vietnam.png',
      'text': 'Vietnam',
      'isClicked': false
    },
    {
      'imagePath': 'assets/images/China.png',
      'text': 'China',
      'isClicked': false
    },
    {
      'imagePath': 'assets/images/Canada.png',
      'text': 'Canada',
      'isClicked': false
    },
    {
      'imagePath': 'assets/images/Saudi Arabia.png',
      'text': 'Saudi Arabia',
      'isClicked': false
    },
    {
      'imagePath': 'assets/images/Argentina.png',
      'text': 'Argentina',
      'isClicked': false
    },
    {
      'imagePath': 'assets/images/Brazil.png',
      'text': 'Brazil',
      'isClicked': false
    },
  ];

  FinishScreenModel finishScreenModel = FinishScreenModel(
    title: 'Your account has been set up!',
    subTitle: 'We have customized feeds according to your preferences',
    imagePath: 'assets/images/Success Account Ilustration.svg',
    buttonText: 'Get Started',
    onPressed: (context) {
      MyCache.putBool(key: MyCacheKeys.isRegisterFinished, value: true);
      Navigator.pushNamedAndRemoveUntil(context, loginScreen, (route) => false);
    },
    isIconButton: true,
    onPressedIcon: (context) {
      Navigator.pushNamedAndRemoveUntil(
          context, registerScreen2, (route) => false);
    }, isButton: true,
  );

  void postRegister(
      {required String email, required String password, required String name}) {
    emit(RegisterLoadingState());

    RegisterRequest()
        .registerRequest(email: email, password: password, name: name)
        .then((value) {
      registerResponse = value;
      emit(RegisterSuccessState());
    }).catchError((error) {
      emit(RegisterErrorState());
    });
  }

  void onChangePassword(
      {required String text,
      required String password,
      required bool passwordError}) {
    if (text.isEmpty) {
      message = "Password must be at least 8 character";
      messageColor = Colors.grey;
      passwordError = false;
    } else if (text.length < 8) {
      message = "Password must be at least 8 character";
      messageColor = Colors.red;
      passwordError = true;
    } else {
      message = "Ok, The Password is at least 8 character";
      messageColor = Colors.green;
      passwordError = false;
    }
    emit(OnChangePasswordState());
  }

  void onClickedJob({required int index}) {
    if (jobs[index]['isClicked']) {
      jobs[index]['isClicked'] = false;
    } else {
      jobs[index]['isClicked'] = true;
    }
    emit(OnClickedJobState());
  }

  void onClickedCountry({required int index}) {
    if (countries[index]['isClicked']) {
      countries[index]['isClicked'] = false;
    } else {
      countries[index]['isClicked'] = true;
    }
    emit(OnClickedCountryState());
  }

  dynamic finishRegister(BuildContext context) {
    emit(FinishRegisterState());
  }
}
