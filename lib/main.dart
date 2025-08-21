import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder/business_logic/apply_job_cubit/apply_job_cubit.dart';
import 'package:job_finder/business_logic/home_layout_cubit/home_layout_cubit.dart';
import 'package:job_finder/business_logic/onboarding_cubit/onboarding_cubit.dart';
import 'package:job_finder/business_logic/profile_cubit/profile_cubit.dart';
import 'package:job_finder/data/local_data/my_cache.dart';
import 'package:job_finder/presentation/routers/app_router.dart';
import 'package:sizer/sizer.dart';

import 'business_logic/applied_cubit/applied_cubit.dart';
import 'business_logic/home_cubit/home_cubit.dart';
import 'business_logic/login_cubit/login_cubit.dart';
import 'business_logic/messages_cubit/messages_cubit.dart';
import 'business_logic/register_cubit/register_cubit.dart';
import 'core/my_bloc_observer.dart';
import 'data/remote_data/data_providers/my_dio.dart';

void main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  await MyCache.initCache();
  Bloc.observer = MyBlocObserver();
  MyDio.dioInit();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RegisterCubit(),
          ),
          BlocProvider(
            create: (context) => OnboardingCubit(),
          ),
          BlocProvider(
            create: (context) => LoginCubit(),
          ),
          BlocProvider(
            create: (context) => HomeLayoutCubit(),
          ),
          BlocProvider(
            create: (context) => HomeCubit(),
          ),
          BlocProvider(
            create: (context) => ApplyJobCubit(),
          ),
          BlocProvider(
            create: (context) => MessagesCubit(),
          ),
          BlocProvider(
            create: (context) => AppliedCubit(),
          ),
          BlocProvider(
            create: (context) => ProfileCubit(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Job Finder App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          onGenerateRoute: appRouter.onGenerateRoute,
        ),
      );
    });
  }
}
