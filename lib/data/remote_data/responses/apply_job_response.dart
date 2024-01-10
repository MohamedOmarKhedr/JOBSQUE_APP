

class ApplyJobResponse {
  ApplyJobResponse({
      bool? status, 
      ApplyJobData? data,}){
    _status = status;
    _data = data;
}

  ApplyJobResponse.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? ApplyJobData.fromJson(json['data']) : null;
  }
  bool? _status;
  ApplyJobData? _data;

  bool? get status => _status??false;
  ApplyJobData? get data => _data?? ApplyJobData();



}


class ApplyJobData {
  ApplyJobData({
      String? cvFile, 
      String? name, 
      String? email, 
      String? mobile, 
      String? workType, 
      String? otherFile, 
      String? jobsId, 
      String? userId, 
      bool? reviewed, 
      String? updatedAt, 
      String? createdAt, 
      num? id,}){
    _cvFile = cvFile;
    _name = name;
    _email = email;
    _mobile = mobile;
    _workType = workType;
    _otherFile = otherFile;
    _jobsId = jobsId;
    _userId = userId;
    _reviewed = reviewed;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
}

  ApplyJobData.fromJson(dynamic json) {
    _cvFile = json['cv_file'];
    _name = json['name'];
    _email = json['email'];
    _mobile = json['mobile'];
    _workType = json['work_type'];
    _otherFile = json['other_file'];
    _jobsId = json['jobs_id'];
    _userId = json['user_id'];
    _reviewed = json['reviewed'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }
  String? _cvFile;
  String? _name;
  String? _email;
  String? _mobile;
  String? _workType;
  String? _otherFile;
  String? _jobsId;
  String? _userId;
  bool? _reviewed;
  String? _updatedAt;
  String? _createdAt;
  num? _id;

  String? get cvFile => _cvFile??'';
  String? get name => _name??'';
  String? get email => _email??'';
  String? get mobile => _mobile??'';
  String? get workType => _workType??'';
  String? get otherFile => _otherFile??'';
  String? get jobsId => _jobsId??'';
  String? get userId => _userId??'';
  bool? get reviewed => _reviewed??false;
  String? get updatedAt => _updatedAt??'';
  String? get createdAt => _createdAt??'';
  num? get id => _id??0;



}