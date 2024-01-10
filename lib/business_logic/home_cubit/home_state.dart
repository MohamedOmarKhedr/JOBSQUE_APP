part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

final class GetJobsSuccessState extends HomeState {}

final class GetJobsLoadingState extends HomeState {}

final class GetJobsErrorState extends HomeState {}

final class FilterJobsSuccessState extends HomeState {}

final class FilterJobsLoadingState extends HomeState {}

final class FilterJobsErrorState extends HomeState {}

final class IsSavedClickedState extends HomeState {}

final class OnTapSavedClickedState extends HomeState {}

final class GetNotificationSuccessState extends HomeState {}

final class GetNotificationLoadingState extends HomeState {}

final class GetNotificationErrorState extends HomeState {}



