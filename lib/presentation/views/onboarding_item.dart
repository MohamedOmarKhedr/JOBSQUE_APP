import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_finder/presentation/style/colors.dart';
import 'package:job_finder/presentation/widgets/my_button.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../business_logic/onboarding_cubit/onboarding_cubit.dart';
import '../../data/models/onboarding_model.dart';

class OnboardingItem extends StatefulWidget {
  final OnboardingCubit onboardingCubit;
  final PageController pageController;
  final OnboardingModel onBoardingModel;
  final int index;

  const OnboardingItem({
    super.key,
    required this.pageController,
    required this.onboardingCubit,
    required this.index,
    required this.onBoardingModel,
  });

  @override
  State<OnboardingItem> createState() => _OnboardingItemState();
}

class _OnboardingItemState extends State<OnboardingItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        leadingWidth: 80,
        leading: Padding(
            padding: EdgeInsets.only(left: 3.w),
            child: SvgPicture.asset(
              "assets/images/Logo.svg",
            )),
        actions: [
          !widget.onboardingCubit.isLast
              ? Padding(
                  padding: EdgeInsets.only(left: 3.w),
                  child: TextButton(
                      onPressed: () =>
                          widget.onboardingCubit.finishOnBoarding(context),
                      child: const Text(
                        "Skip",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, color: grey),
                      )),
                )
              : const Text(''),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 6.w,
            ),
            child: Image.asset(
              widget.onBoardingModel.imagePath,
              width: 88.w,
              height: 40.h,
              fit: BoxFit.cover,
              alignment: Alignment.bottomLeft,
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 4.w),
              child: RichText(
                text: TextSpan(
                  text: widget.onBoardingModel.subTitle1,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    fontSize: 25.sp,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: widget.onBoardingModel.subTitle2,
                      style: TextStyle(
                          color: blue,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                          fontSize: 25.sp),
                    ),
                    TextSpan(
                      text: widget.onBoardingModel.subTitle3,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                        fontSize: 25.sp,
                      ),
                    )
                  ],
                ),
              )),
          Container(
            margin: EdgeInsets.only(right: 3.w, left: 3.w, bottom: 1.5.h),
            child: Text(
              widget.onBoardingModel.description,
              style: TextStyle(
                color: grey,
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
              ),
            ),
          ),
          SmoothPageIndicator(
            controller: widget.pageController,
            count: widget.onboardingCubit.onBoardingList.length,
            effect: const ScaleEffect(
                dotColor: lightBlue, activeDotColor: blue, scale: 1.2),
          ),
          Visibility(
              visible: !widget.onboardingCubit.isLast,
              replacement: MyButton(
                margin: EdgeInsets.only(top: 2.h, left: 10.w, right: 10.w),
                onPressed: () =>
                    widget.onboardingCubit.finishOnBoarding(context),
                text: "Get Start",
              ),
              child: MyButton(
                onPressed: () {
                  widget.onboardingCubit
                      .onNextPage(widget.index, widget.pageController);
                },
                text: "Next",
                margin: EdgeInsets.only(top: 2.h, left: 10.w, right: 10.w),
              ))
        ],
      ),
    );
  }
}
