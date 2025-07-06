import '../../domain/entities/send_password_email_entity.dart';

/// email : "aloaaa971@gmail.com"

class SendPasswordEmailDm extends SendPasswordEmailEntity{
  SendPasswordEmailDm({
      this.email,
    this.message
  });

  SendPasswordEmailDm.fromJson(dynamic json) {
    email = json['email'];
  }
  String? email;
  String? message;


}