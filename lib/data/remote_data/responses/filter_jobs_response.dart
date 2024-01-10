
import 'get_jobs_response.dart';

class FilterJobsResponse {
  FilterJobsResponse({
      bool? status, 
      List<JobData>? data,}){
    _status = status;
    _data = data;
}

  FilterJobsResponse.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(JobData.fromJson(v));
      });
    }
  }
  bool? _status;
  List<JobData>? _data;

  bool? get status => _status??false;
  List<JobData>? get data => _data??[];


}

