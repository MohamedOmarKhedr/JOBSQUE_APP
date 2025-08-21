import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder/business_logic/onboarding_cubit/onboarding_cubit.dart';

import '../../Views/onboarding_item.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  final PageController pageController = PageController();
  late OnboardingCubit onboardingCubit;

  @override
  void didChangeDependencies() {
    onboardingCubit = OnboardingCubit.get(context);
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {



    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return PageView.builder(
          controller: pageController,
          itemCount: onboardingCubit.onBoardingList.length,
          onPageChanged: (index) {
            onboardingCubit.isLastPage(index);
          },
          itemBuilder: (context, index) {
            return OnboardingItem(
                pageController: pageController,
                onboardingCubit: onboardingCubit,
                index: index,
                onBoardingModel: onboardingCubit.onBoardingList[index]);
          },
        );
      },
    );
  }
}
