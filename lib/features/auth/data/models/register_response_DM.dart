import 'package:markti/features/auth/domain/entities/register_repspons_intity.dart';

/// name : "ali"
/// phone : "01225164522"
/// email : "aloaaa971@gmail.com"
/// password : "As@123456"
/// confirmPassword : "As@123456"

class RegisterResponseDm extends RegisterResponseEntity{
  RegisterResponseDm({
      super.name,
      super.phone,
      super.email,
      super.password,
      super.confirmPassword,
  super.message,
    super.token
  });

  RegisterResponseDm.fromJson(dynamic json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    message = json['message'];
    token = json['token'];
  }
  String? name;
  String? phone;
  String? email;
  String? password;
  String? confirmPassword;
  String? message;
  String? token;


}