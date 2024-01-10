
class NotificationResponse {
  NotificationResponse({
      bool? status, 
      NotificationData? data,}){
    _status = status;
    _data = data;
}

  NotificationResponse.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? NotificationData.fromJson(json['data']) : null;
  }
  bool? _status;
  NotificationData? _data;

  bool? get status => _status ?? false;
  NotificationData? get data => _data ?? NotificationData();



}

class NotificationData {
  NotificationData({
      num? id, 
      String? userId, 
      String? compId, 
      String? compName, 
      String? userName, 
      String? lastMassage, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _userId = userId;
    _compId = compId;
    _compName = compName;
    _userName = userName;
    _lastMassage = lastMassage;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  NotificationData.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _compId = json['comp_id'];
    _compName = json['comp_name'];
    _userName = json['user_name'];
    _lastMassage = json['last_massage'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _userId;
  String? _compId;
  String? _compName;
  String? _userName;
  String? _lastMassage;
  String? _createdAt;
  String? _updatedAt;

  num? get id => _id??0;
  String? get userId => _userId??'';
  String? get compId => _compId??'';
  String? get compName => _compName??'';
  String? get userName => _userName??'';
  String? get lastMassage => _lastMassage??'';
  String? get createdAt => _createdAt??'';
  String? get updatedAt => _updatedAt??'';



}