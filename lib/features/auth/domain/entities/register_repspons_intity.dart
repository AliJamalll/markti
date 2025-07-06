/// name : "ali"
/// phone : "01225164522"
/// email : "aloaaa971@gmail.com"
/// password : "As@123456"
/// confirmPassword : "As@123456"

class RegisterResponseEntity {
  RegisterResponseEntity({
      this.name, 
      this.phone, 
      this.email, 
      this.password, 
      this.confirmPassword,
    this.message,
    this.token
  });

  String? name;
  String? phone;
  String? email;
  String? password;
  String? confirmPassword;
  String? message;
  String? token;


}