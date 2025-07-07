/// email : "aloaaa971@gmail.com"
/// password : "As@12345678"
/// confirmPassword : "As@12345678"

class NewPasswordResponseEntity {
  NewPasswordResponseEntity({
      this.email, 
      this.password, 
      this.confirmPassword,
  this.message});

  String? email;
  String? password;
  String? confirmPassword;
  String? message;


}