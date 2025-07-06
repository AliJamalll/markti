import 'package:markti/features/auth/domain/entities/login_response_entity.dart';

/// message : "login successfully"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4NjY5MzY3YWNiOGY1NjZhZDcwMWZhMSIsImlhdCI6MTc1MTY0MTIwM30.Hm-1oCZVL2dutqW_5nGbMjq4FUhe26aKIyCW3NisF08"
/// name : "ali"
/// statusCode : 200
/// status : true

class LoginResponseDm extends LoginResponseEntity{
  LoginResponseDm({
      super.message,
      super.token,
      super.name,
      super.statusCode,
      super.status,
  super.email
  });

  LoginResponseDm.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'];
    name = json['name'];
    statusCode = json['statusCode'];
    status = json['status'];
    email = json['email'];
  }
  // String? message;
  // String? token;
  // String? name;
  // num? statusCode;
  // bool? status;
  // bool? email;


}