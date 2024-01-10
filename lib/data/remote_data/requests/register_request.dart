import 'package:dio/dio.dart';
import 'package:job_finder/core/constants_methods.dart';
import 'package:job_finder/core/end_points.dart';
import 'package:job_finder/data/remote_data/data_providers/my_dio.dart';
import '../responses/register_response.dart';

class RegisterRequest {
  Future registerRequest({required String email,required String password,required String name}) async {
    try {
      Response response = await MyDio.postData(
        data: {'name':name,'email':email,'password':password},
          endPoint: authRegister,);
      printTest('registerRequest status code ${response.statusCode}');
      printResponse('registerRequest: ${response.data}');
      return RegisterResponse.fromJson(response.data);
    } catch (error) {
      printError("registerRequest: ${error.toString()}");
    }
  }
}
