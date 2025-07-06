import 'package:markti/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:markti/features/auth/domain/entities/login_response_entity.dart';
import 'package:markti/features/auth/domain/entities/register_repspons_intity.dart';
import 'package:markti/features/auth/domain/entities/send_password_email_entity.dart';

abstract class AuthRepository{

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