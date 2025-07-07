import 'package:markti/features/auth/domain/entities/new_password_response_entity.dart';

/// email : "aloaaa971@gmail.com"
/// password : "As@12345678"
/// confirmPassword : "As@12345678"

class NewPaaswordResponseDm extends NewPasswordResponseEntity{
  NewPaaswordResponseDm({
      this.email, 
      this.password, 
      this.confirmPassword,
    this.message
  });

  NewPaaswordResponseDm.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    message = json['message'];
  }
  String? email;
  String? password;
  String? confirmPassword;
  String? message;


}