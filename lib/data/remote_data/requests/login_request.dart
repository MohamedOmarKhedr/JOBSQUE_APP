import 'package:dio/dio.dart';

import '../../../core/constants_methods.dart';
import '../../../core/end_points.dart';
import '../data_providers/my_dio.dart';
import '../responses/login_response.dart';

class LoginRequest {
  Future loginRequest({required String email,required String password}) async {
    try {
      Response response = await MyDio.postData(
        data: {'email':email,'password':password},
        endPoint: authLogin,);
      printTest('loginRequest status code ${response.statusCode}');
      printResponse('loginRequest: ${response.data}');
      return LoginResponse.fromJson(response.data);
    } catch (error) {
      printError("loginRequest: ${error.toString()}");
    }
  }
}