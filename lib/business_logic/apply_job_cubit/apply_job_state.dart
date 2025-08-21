part of 'apply_job_cubit.dart';

abstract class ApplyJobState {}

class ApplyJobInitial extends ApplyJobState {}

final class ChangeJobDetailScreensIndexState extends ApplyJobState {}

final class ChangeApplyJobScreensIndexState extends ApplyJobState {}

final class PickCvFileSuccessState extends ApplyJobState {}

final class PickCvFileLoadingState extends ApplyJobState {}

final class PickCvFileErrorState extends ApplyJobState {}

final class PickOtherFileSuccessState extends ApplyJobState {}

final class PickOtherFileLoadingState extends ApplyJobState {}

final class PickOtherFileErrorState extends ApplyJobState {}

final class ApplyJobSuccessState extends ApplyJobState {}

final class ApplyJobLoadingState extends ApplyJobState {}

final class ApplyJobErrorState extends ApplyJobState {}

final class OnApplyJobButtonState extends ApplyJobState {}

final class AfterApplyJobState extends ApplyJobState {}
