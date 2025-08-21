part of 'profile_cubit.dart';


abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

final class PickProfileImageLoadingState extends ProfileState {}

final class PickProfileImageSuccessfulState extends ProfileState {}

final class PickProfileImageErrorState extends ProfileState {}

final class PickPortfolioFileLoadingState extends ProfileState {}

final class PickPortfolioFileSuccessfulState extends ProfileState {}

final class PickPortfolioFileErrorState extends ProfileState {}

final class RemovePortfolioState extends ProfileState {}

final class EditPortfolioState extends ProfileState {}

final class UpdateUserDataSuccessState extends ProfileState {}

final class UpdateUserDataLoadingState extends ProfileState {}

final class UpdateUserDataErrorState extends ProfileState {}

final class IsPortfolioDoneState extends ProfileState {}

final class IsPersonalDetailsDoneState extends ProfileState {}

final class IsEducationDoneState extends ProfileState {}

final class IsExperienceDoneState extends ProfileState {}

final class AfterLogoutSuccessState extends ProfileState {}








