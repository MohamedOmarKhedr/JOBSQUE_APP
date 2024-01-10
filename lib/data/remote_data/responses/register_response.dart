class RegisterResponse {
  RegisterResponse({
    bool? status,
    Data? data,
    Profile? profile,
    String? token,
  }) {
    _status = status;
    _data = data;
    _profile = profile;
    _token = token;
  }

  RegisterResponse.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _profile =
        json['profile'] != null ? Profile.fromJson(json['profile']) : null;
    _token = json['token'];
  }
  bool? _status;
  Data? _data;
  Profile? _profile;
  String? _token;

  bool? get status => _status ?? false;
  Data? get data => _data ?? Data();
  Profile? get profile => _profile ?? Profile();
  String? get token => _token ?? '';
}

class Profile {
  Profile({
    num? userId,
    String? name,
    String? email,
    String? updatedAt,
    String? createdAt,
    num? id,
  }) {
    _userId = userId;
    _name = name;
    _email = email;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
  }

  Profile.fromJson(dynamic json) {
    _userId = json['user_id'];
    _name = json['name'];
    _email = json['email'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }
  num? _userId;
  String? _name;
  String? _email;
  String? _updatedAt;
  String? _createdAt;
  num? _id;

  num? get userId => _userId ?? 0;
  String? get name => _name ?? '';
  String? get email => _email ?? '';
  String? get updatedAt => _updatedAt ?? '';
  String? get createdAt => _createdAt ?? '';
  num? get id => _id ?? 0;
}

class Data {
  Data({
    String? name,
    String? email,
    num? otp,
    String? updatedAt,
    String? createdAt,
    num? id,
  }) {
    _name = name;
    _email = email;
    _otp = otp;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
  }

  Data.fromJson(dynamic json) {
    _name = json['name'];
    _email = json['email'];
    _otp = json['otp'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }
  String? _name;
  String? _email;
  num? _otp;
  String? _updatedAt;
  String? _createdAt;
  num? _id;

  String? get name => _name ?? '';
  String? get email => _email ?? '';
  num? get otp => _otp ?? 0;
  String? get updatedAt => _updatedAt ?? '';
  String? get createdAt => _createdAt ?? '';
  num? get id => _id ?? 0;
}
