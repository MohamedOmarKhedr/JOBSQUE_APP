import 'package:dio/dio.dart';
import 'package:job_finder/core/end_points.dart';

import '../../../core/constants_methods.dart';
import '../data_providers/my_dio.dart';
import '../responses/update_user_data_response.dart';

class UpdateUserDataRequest {
  Future updateUserDataRequest(
      {required String name,
      required String password,
      required String token}) async {
    try {
      Response response = await MyDio.postData(
          data: {'name': name, 'password': password},
          endPoint: authUpdate,
          token: token);
      printTest('updateUserDataRequest status code ${response.statusCode}');
      printResponse('updateUserDataRequest: ${response.data}');
      return UpdateUserDataResponse.fromJson(response.data);
    } catch (error) {
      printError("updateUserDataRequest: ${error.toString()}");
    }
  }
}
