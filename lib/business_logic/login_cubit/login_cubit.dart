import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/my_cache_keys.dart';
import '../../data/local_data/my_cache.dart';
import '../../data/remote_data/requests/login_request.dart';
import '../../data/remote_data/responses/login_response.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of<LoginCubit>(context);

  LoginResponse loginResponse = LoginResponse();

  String email = '';
  String password = '';

  late String token;
  late UserResponse userResponse;

  void postLogin(
      {required String email, required String password}) {
    emit(LoginLoadingState());

    LoginRequest()
        .loginRequest(email: email, password: password,)
        .then((value) {
      loginResponse = value;
      emit(LoginSuccessState());
    }).catchError((error) {
      emit(LoginErrorState());
    });
  }

  void afterLoginSuccess(){

    token = loginResponse.token!;
    userResponse = loginResponse.user!;
    MyCache.putString(key: MyCacheKeys.token, value: token);
    MyCache.putString(key: MyCacheKeys.userName, value: userResponse.name!);
    MyCache.putString(key: MyCacheKeys.password, value: password);
    MyCache.putString(key: MyCacheKeys.email, value: userResponse.email!);
    MyCache.putInt(key: MyCacheKeys.userId, value: userResponse.id!.toInt());

    if (kDebugMode) {
      print(MyCache.getString(key: MyCacheKeys.email));
    }

    emit(AfterLoginSuccessState());
  }


}


