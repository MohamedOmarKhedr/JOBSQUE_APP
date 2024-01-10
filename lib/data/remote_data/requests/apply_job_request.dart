import 'package:dio/dio.dart';

import '../../../core/constants_methods.dart';
import '../../../core/end_points.dart';
import '../data_providers/my_dio.dart';
import '../responses/apply_job_response.dart';

class ApplyJobRequest {
  Future applyJobRequest({
    required String token,
    required String cvFilePath,
    required String cvFileName,
    required String email,
    required String name,
    required String mobile,
    required String workType,
    required String otherFilePath,
    required String otherFileName,
    required String jobsId,
    required String userId,
  }) async {
    try {
      final formData = FormData.fromMap({
        'cv_file': await MultipartFile.fromFile(
          cvFilePath,
          filename: cvFileName,
        ),
        'other_file': await MultipartFile.fromFile(
          otherFilePath,
          filename: otherFileName,
        ),
        'name': name,
        'email': email,
        'mobile': mobile,
        'work_type': workType,
        'jobs_id': jobsId,
        'user_id': userId
      });

      Response response = await MyDio.postData(
        token: token,
        data: formData,
        endPoint: applyJob,
      );
      printTest('applyJobRequest status code ${response.statusCode}');
      printResponse('applyJobRequest: ${response.data}');
      return ApplyJobResponse.fromJson(response.data);
    } catch (error) {
      printError("applyJobRequest: ${error.toString()}");
    }
  }
}
