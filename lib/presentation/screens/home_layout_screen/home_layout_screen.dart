import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_finder/presentation/style/colors.dart';

import '../../../business_logic/home_layout_cubit/home_layout_cubit.dart';

class HomeLayoutScreen extends StatefulWidget {
  const HomeLayoutScreen({super.key});

  @override
  State<HomeLayoutScreen> createState() => _HomeLayoutScreenState();
}

class _HomeLayoutScreenState extends State<HomeLayoutScreen> {
  late HomeLayoutCubit homeLayoutCubit;

  @override
  void didChangeDependencies() {
    homeLayoutCubit = HomeLayoutCubit.get(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeLayoutCubit, HomeLayoutState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              homeLayoutCubit.screens[homeLayoutCubit.currentIndex],
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              currentIndex: homeLayoutCubit.currentIndex,
              onTap: (index) => homeLayoutCubit.changeScreensIndex(index),
              selectedItemColor: blue,
              items: [
                BottomNavigationBarItem(
                  icon: Visibility(
                    visible: homeLayoutCubit.currentIndex == 0,
                    replacement:
                        SvgPicture.asset(homeLayoutCubit.imagePath1[0]),
                    child: SvgPicture.asset(homeLayoutCubit.imagePath2[0]),
                  ),
                  label: homeLayoutCubit.titles[0],

                ),
                BottomNavigationBarItem(
                  icon: Visibility(
                    visible: homeLayoutCubit.currentIndex == 1,
                    replacement:
                        SvgPicture.asset(homeLayoutCubit.imagePath1[1]),
                    child: SvgPicture.asset(homeLayoutCubit.imagePath2[1]),
                  ),
                  label: homeLayoutCubit.titles[1],
                ),
                BottomNavigationBarItem(
                  icon: Visibility(
                    visible: homeLayoutCubit.currentIndex == 2,
                    replacement:
                        SvgPicture.asset(homeLayoutCubit.imagePath1[2]),
                    child: SvgPicture.asset(homeLayoutCubit.imagePath2[2]),
                  ),
                  label: homeLayoutCubit.titles[2],
                ),
                BottomNavigationBarItem(
                  icon: Visibility(
                    visible: homeLayoutCubit.currentIndex == 3,
                    replacement:
                        SvgPicture.asset(homeLayoutCubit.imagePath1[3]),
                    child: SvgPicture.asset(homeLayoutCubit.imagePath2[3]),
                  ),
                  label: homeLayoutCubit.titles[3],
                ),
                BottomNavigationBarItem(
                  icon: Visibility(
                    visible: homeLayoutCubit.currentIndex == 4,
                    replacement:
                        SvgPicture.asset(homeLayoutCubit.imagePath1[4]),
                    child: SvgPicture.asset(homeLayoutCubit.imagePath2[4]),
                  ),
                  label: homeLayoutCubit.titles[4],
                ),
              ]),
        );
      },
    );
  }
}
