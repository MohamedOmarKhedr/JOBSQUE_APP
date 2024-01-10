
class UpdateUserDataResponse {
  UpdateUserDataResponse({
      bool? status, 
      UpdateUserData? data,}){
    _status = status;
    _data = data;
}

  UpdateUserDataResponse.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? UpdateUserData.fromJson(json['data']) : null;
  }
  bool? _status;
  UpdateUserData? _data;

  bool? get status => _status??false;
  UpdateUserData? get data => _data??UpdateUserData();


}


class UpdateUserData {
  UpdateUserData({
      num? id, 
      String? name, 
      String? otp, 
      dynamic towStep, 
      String? email, 
      dynamic emailVerifiedAt, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _otp = otp;
    _towStep = towStep;
    _email = email;
    _emailVerifiedAt = emailVerifiedAt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  UpdateUserData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _otp = json['otp'];
    _towStep = json['tow_step'];
    _email = json['email'];
    _emailVerifiedAt = json['email_verified_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  String? _otp;
  dynamic _towStep;
  String? _email;
  dynamic _emailVerifiedAt;
  String? _createdAt;
  String? _updatedAt;

  num? get id => _id??0;
  String? get name => _name??'';
  String? get otp => _otp??'';
  dynamic get towStep => _towStep??'';
  String? get email => _email??'';
  dynamic get emailVerifiedAt => _emailVerifiedAt??'';
  String? get createdAt => _createdAt??'';
  String? get updatedAt => _updatedAt??'';



}