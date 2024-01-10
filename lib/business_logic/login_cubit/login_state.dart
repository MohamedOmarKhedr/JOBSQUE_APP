part of 'login_cubit.dart';


abstract class LoginState {}

class LoginInitial extends LoginState {}

final class LoginSuccessState extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginErrorState extends LoginState {}

final class AfterLoginSuccessState extends LoginState {}
