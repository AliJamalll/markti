import 'package:dartz/dartz.dart';

import '../../../../../../core/failures/failure.dart';
import '../../../entities/active_reset_password_response_entity.dart';
import '../../../entities/login_response_entity.dart';
import '../../../entities/new_password_response_entity.dart';
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

  Future<Either<Failure,ActiveResetPasswordResponseEntity>> activeResetPassword(
      String email,
      String code,
      String message,
      );

  Future<Either<Failure,NewPasswordResponseEntity>> newPasswordEntity(
      String email,
      String password,
      String confirmPassword,
      );
}