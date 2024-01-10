
class GetJobsResponse {
  GetJobsResponse({
      bool? status, 
      List<JobData>? data,}){
    _status = status;
    _data = data;
}

  GetJobsResponse.fromJson(dynamic json) {
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


class JobData {
  JobData({
      num? id, 
      String? name, 
      String? image, 
      String? jobTimeType, 
      String? jobType, 
      String? jobLevel, 
      String? jobDescription, 
      String? jobSkill, 
      String? compName, 
      String? compEmail, 
      String? compWebsite, 
      String? aboutComp, 
      String? location, 
      String? salary, 
      num? favorites, 
      num? expired, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _image = image;
    _jobTimeType = jobTimeType;
    _jobType = jobType;
    _jobLevel = jobLevel;
    _jobDescription = jobDescription;
    _jobSkill = jobSkill;
    _compName = compName;
    _compEmail = compEmail;
    _compWebsite = compWebsite;
    _aboutComp = aboutComp;
    _location = location;
    _salary = salary;
    _favorites = favorites;
    _expired = expired;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  JobData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _jobTimeType = json['job_time_type'];
    _jobType = json['job_type'];
    _jobLevel = json['job_level'];
    _jobDescription = json['job_description'];
    _jobSkill = json['job_skill'];
    _compName = json['comp_name'];
    _compEmail = json['comp_email'];
    _compWebsite = json['comp_website'];
    _aboutComp = json['about_comp'];
    _location = json['location'];
    _salary = json['salary'];
    _favorites = json['favorites'];
    _expired = json['expired'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  String? _image;
  String? _jobTimeType;
  String? _jobType;
  String? _jobLevel;
  String? _jobDescription;
  String? _jobSkill;
  String? _compName;
  String? _compEmail;
  String? _compWebsite;
  String? _aboutComp;
  String? _location;
  String? _salary;
  num? _favorites;
  num? _expired;
  String? _createdAt;
  String? _updatedAt;

  num? get id => _id??0;
  String? get name => _name??'';
  String? get image => _image??'';
  String? get jobTimeType => _jobTimeType??'';
  String? get jobType => _jobType??'';
  String? get jobLevel => _jobLevel??'';
  String? get jobDescription => _jobDescription??'';
  String? get jobSkill => _jobSkill??'';
  String? get compName => _compName??'';
  String? get compEmail => _compEmail??'';
  String? get compWebsite => _compWebsite??'';
  String? get aboutComp => _aboutComp??'';
  String? get location => _location??'';
  String? get salary => _salary??'';
  num? get favorites => _favorites??0;
  num? get expired => _expired??0;
  String? get createdAt => _createdAt??'';
  String? get updatedAt => _updatedAt??'';


}