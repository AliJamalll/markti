import 'package:markti/features/auth/domain/entities/active_reset_password_response_entity.dart';

/// email : "aloaaa971@gmail.com"
/// code : "292986"

class ActiveResetPasswordResponseDm extends ActiveResetPasswordResponseEntity{
  ActiveResetPasswordResponseDm({
      this.email, 
      this.code,
    this.message
  });

  ActiveResetPasswordResponseDm.fromJson(dynamic json) {
    email = json['email'];
    code = json['code'];
    message = json['message'];
  }
  String? email;
  String? code;
  String? message;


}