import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder/core/my_cache_keys.dart';
import 'package:job_finder/data/local_data/my_cache.dart';
import 'package:job_finder/presentation/screens/applied_screen/applied_screen.dart';
import 'package:job_finder/presentation/screens/home_screen/home_screen.dart';
import 'package:job_finder/presentation/screens/messages_screen/messages_screen.dart';
import 'package:job_finder/presentation/screens/profile_screen/profile_screen.dart';
import 'package:job_finder/presentation/screens/saved_screen/saved_screen.dart';

part 'home_layout_state.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  HomeLayoutCubit() : super(HomeLayoutInitial());

  static HomeLayoutCubit get(context) =>
      BlocProvider.of<HomeLayoutCubit>(context);

  int currentIndex = MyCache.getInt(key: MyCacheKeys.currentScreenIndex);

  List<Widget> screens = [
    const HomeScreen(),
    const MessagesScreen(),
    const AppliedScreen(),
    const SavedScreen(),
    const ProfileScreen()
  ];

  List<String> titles = ['Home', 'Messages', 'Applied', 'Saved', 'Profile'];

  List<String> imagePath1 = [
    'assets/images/home_layout/home.svg',
    'assets/images/home_layout/message.svg',
    'assets/images/home_layout/applied.svg',
    'assets/images/home_layout/saved.svg',
    'assets/images/home_layout/profile.svg'
  ];

  List<String> imagePath2 = [
    'assets/images/home_layout/home2.svg',
    'assets/images/home_layout/message2.svg',
    'assets/images/home_layout/applied2.svg',
    'assets/images/home_layout/saved2.svg',
    'assets/images/home_layout/profile2.svg'
  ];

  void changeScreensIndex(int index) {
    currentIndex = index;
    MyCache.putInt(key: MyCacheKeys.currentScreenIndex, value: index);
    emit(ChangeScreensIndexState());
  }
}
