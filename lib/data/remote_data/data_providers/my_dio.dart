import 'package:dio/dio.dart';
import 'package:job_finder/core/constants.dart';

class MyDio {
  static Dio? dio;

  static dioInit() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseURL,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );
  }

  static Future<Response> getData(
      {required String endPoint,
        Map<String, dynamic>? query,
        String? token}) async {
    dio!.options.headers['Authorization'] = 'Bearer $token';
    return await dio!.get(endPoint, queryParameters: query);
  }

  static Future<Response> postData(
      {required String endPoint,
        Map<String, dynamic>? query,
        Object? data,
        String? token}) async {
    dio!.options.headers = {'Content-Type': 'application/json'};
    dio!.options.headers['Authorization'] = 'Bearer $token';
    return await dio!.post(endPoint, queryParameters: query, data: data);
  }

  static Future<Response> setData(
      {required String endPoint,
        Map<String, dynamic>? query,
        Object? data,
        String? token}) async {
    dio!.options.headers = {'Content-Type': 'application/json'};
    dio!.options.headers['Authorization'] = 'Bearer $token';
    return await dio!.put(endPoint, queryParameters: query, data: data);
  }
}
