import 'package:dartz/dartz.dart';

import '../../../../../../core/failures/failure.dart';
import '../../../entities/login_response_entity.dart';
import '../../../entities/register_repspons_intity.dart';
import '../../../entities/send_password_email_entity.dart';

abstract class AuthRemoteDataSource{

  Future<Either<Failure,RegisterResponseEntity>> register(
      String name,
      String email,
      String phone,
      String password,
      String confirmPassword,
      );

  Future<Either<Failure,LoginResponseEntity>> login(
      String email,
      String password,
      );

  Future<Either<Failure,SendPasswordEmailEntity>> sendResetPassword(
      String email,
      );
}