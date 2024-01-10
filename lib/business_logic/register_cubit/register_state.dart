part of 'register_cubit.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

final class RegisterSuccessState extends RegisterState {}

final class RegisterLoadingState extends RegisterState {}

final class RegisterErrorState extends RegisterState {}

final class OnChangePasswordState extends RegisterState {}

final class OnClickedJobState extends RegisterState {}

final class OnClickedCountryState extends RegisterState {}

final class FinishRegisterState extends RegisterState {}


