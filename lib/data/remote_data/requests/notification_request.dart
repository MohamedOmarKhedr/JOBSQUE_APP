import 'package:dio/dio.dart';

import '../../../core/constants_methods.dart';
import '../../../core/end_points.dart';
import '../data_providers/my_dio.dart';
import '../responses/notification_response.dart';

class NotificationRequest {
  Future notificationRequest({required String token}) async {
    try {
      Response response = await MyDio.getData(
        token: token,
        endPoint: notification,);
      printTest('notificationRequest status code ${response.statusCode}');
      printResponse('notificationRequest: ${response.data}');
      return NotificationResponse.fromJson(response.data);
    } catch (error) {
      printError("notificationRequest: ${error.toString()}");
    }
  }
}