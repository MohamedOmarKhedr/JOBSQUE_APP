import 'package:dio/dio.dart';
import '../../../core/constants_methods.dart';
import '../../../core/end_points.dart';
import '../data_providers/my_dio.dart';
import '../responses/get_jobs_response.dart';

class GetJobsRequest {
  Future getJobsRequest({required String token}) async {
    try {
      Response response = await MyDio.getData(
        token: token,
        endPoint: getAllJobs,);
      printTest('getJobsRequest status code ${response.statusCode}');
      printResponse('getJobsRequest: ${response.data}');
      return GetJobsResponse.fromJson(response.data);
    } catch (error) {
      printError("getJobsRequest: ${error.toString()}");
    }
  }
}