
class LoginResponse {
  LoginResponse({
      UserResponse? user,
      String? token, 
      bool? status,}){
    _user = user;
    _token = token;
    _status = status;
}

  LoginResponse.fromJson(dynamic json) {
    _user = json['user'] != null ? UserResponse.fromJson(json['user']) : null;
    _token = json['token'];
    _status = json['status'];
  }
  UserResponse? _user;
  String? _token;
  bool? _status;

  UserResponse? get user => _user?? UserResponse();
  String? get token => _token?? '';
  bool? get status => _status??false;


}


class UserResponse {
  UserResponse({
      num? id, 
      String? name, 
      String? email, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _email = email;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  UserResponse.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  String? _email;
  String? _createdAt;
  String? _updatedAt;

  num? get id => _id??0;
  String? get name => _name??'';
  String? get email => _email??'';
  String? get createdAt => _createdAt??'';
  String? get updatedAt => _updatedAt??'';


}