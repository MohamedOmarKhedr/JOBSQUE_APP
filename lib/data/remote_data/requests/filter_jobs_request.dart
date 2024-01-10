import 'package:dio/dio.dart';
import 'package:job_finder/data/remote_data/responses/filter_jobs_response.dart';

import '../../../core/constants_methods.dart';
import '../../../core/end_points.dart';
import '../data_providers/my_dio.dart';

class FilterJobsRequest {
  Future filterJobsRequest({required String location,required String salary,required String name,required String token}) async {
    try {
      Response response = await MyDio.postData(
        token: token,
        data: {'name':name,'location':location,'salary':salary},
        endPoint: filterJobs,);
      printTest('filterJobsRequest status code ${response.statusCode}');
      printResponse('filterJobsRequest: ${response.data}');
      return FilterJobsResponse.fromJson(response.data);
    } catch (error) {
      printError("filterJobsRequest: ${error.toString()}");
    }
  }
}