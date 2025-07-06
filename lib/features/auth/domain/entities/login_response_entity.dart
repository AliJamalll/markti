/// message : "login successfully"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4NjY5MzY3YWNiOGY1NjZhZDcwMWZhMSIsImlhdCI6MTc1MTY0MTIwM30.Hm-1oCZVL2dutqW_5nGbMjq4FUhe26aKIyCW3NisF08"
/// name : "ali"
/// statusCode : 200
/// status : true

class LoginResponseEntity {
  LoginResponseEntity({
      this.message, 
      this.token, 
      this.name, 
      this.statusCode, 
      this.status,
  this.email,
    //this.password
  });

  String? message;
  String? token;
  String? name;
  num? statusCode;
  bool? status;
  bool? email;
  //bool? password;


}