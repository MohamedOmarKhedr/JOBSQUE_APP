import 'package:flutter_bloc/flutter_bloc.dart';
part 'applied_state.dart';

class AppliedCubit extends Cubit<AppliedState> {
  AppliedCubit() : super(AppliedInitial());

  static AppliedCubit get(context) => BlocProvider.of<AppliedCubit>(context);

  int currentAppliedJobIndex = 0;

  List<String> appliedJobTitles = ['Active', 'Rejected'];

  List<Map<String, dynamic>> appliedJobsData =[
    {
      'logo': 'assets/images/home_layout/Spectrum Logo.png',
      'jobName': 'UI/UX Designer',
      'address': 'Spectrum • Jakarta, Indonesia',
      'imageStep': 'assets/images/home_layout/Step.svg',
      'step': 0
    },
    {
      'logo': 'assets/images/home_layout/VK Logo.png',
      'jobName': 'Senior UI Designer',
      'address': 'VK • Yogyakarta, Indonesia',
      'imageStep': 'assets/images/home_layout/Step2.svg',
      'step': 1
    },
    {
      'logo': 'assets/images/home_layout/Invision Logo.png',
      'jobName': 'Junior UI Designer',
      'address': 'Invision • Jakarta, Indonesia',
      'imageStep': 'assets/images/home_layout/Step3.svg',
      'step': 2
    },
  ];

  void changeJobDetailScreensIndex(int index) {
    currentAppliedJobIndex = index;
    emit(ChangeAppliedJobScreensIndexState());
  }

}
