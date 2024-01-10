import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder/core/screens.dart';

import '../../core/my_cache_keys.dart';
import '../../data/local_data/my_cache.dart';
import '../../data/models/onboarding_model.dart';


part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  static OnboardingCubit get(context) => BlocProvider.of<OnboardingCubit>(context);

  bool isLast = false;
  List<OnboardingModel> onBoardingList = [
    OnboardingModel(
        subTitle1: 'Find a job, and ',
        subTitle2: 'start building ',
        subTitle3: 'your career from now on',
        imagePath: 'assets/images/Background.png',
        description:
        'Explore over 25,924 available job roles and upgrade your operator now.'),
    OnboardingModel(
        subTitle1: 'Hundreds of jobs are waiting for you to ',
        subTitle2: 'join together ',
        subTitle3: '',
        imagePath: 'assets/images/Background (1).png',
        description:
        'Immediately join us and start applying for the job you are interested in.'),
    OnboardingModel(
        subTitle1: 'Get the best ',
        subTitle2: 'choice for the job ',
        subTitle3: "you've always dreamed of",
        imagePath: 'assets/images/Background (2).png',
        description:
        'The better the skills you have, the greater the good job opportunities for you.')
  ];

  void isLastPage(int index){
    if (index == onBoardingList.length - 1) {
      isLast = true;
      emit(IsLastPageState());
    }
  }

  void onNextPage(int index,PageController pageController){
    if (index < 2) {
      pageController.animateToPage(
        index + 1,
        duration: const Duration(milliseconds: 30),
        curve: Curves.ease,
      );
      emit(OnNextPageState());
    }
  }

  void finishOnBoarding(BuildContext context) {
    MyCache.putBool(
        key: MyCacheKeys.isOnBoardingViewed,
        value: isLast);
    Navigator.pushNamedAndRemoveUntil(
        context,
        registerScreen,
            (route) => false);
    emit(FinishOnBoardingState());
  }


}
