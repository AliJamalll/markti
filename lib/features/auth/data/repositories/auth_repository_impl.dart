import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:markti/core/failures/failure.dart';
import 'package:markti/features/auth/domain/entities/active_reset_password_response_entity.dart';
import 'package:markti/features/auth/domain/entities/login_response_entity.dart';
import 'package:markti/features/auth/domain/entities/new_password_response_entity.dart';
import 'package:markti/features/auth/domain/entities/register_repspons_intity.dart';
import 'package:markti/features/auth/domain/entities/send_password_email_entity.dart';
import 'package:markti/features/auth/domain/repositories/data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:markti/features/auth/domain/repositories/repository/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, RegisterResponseEntity>> register(
    String name,
    String email,
    String phone,
    String password,
    String confirmPassword,
  ) async {
    var either = await authRemoteDataSource.register(
      name,
      email,
      phone,
      password,
      confirmPassword,
    );
    return either.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<Failure, LoginResponseEntity>> login(
    String email,
    String password,
  ) async {
    var either = await authRemoteDataSource.login(email, password);
    return either.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<Failure, SendPasswordEmailEntity>> sendResetPassword(String email) async{
    var either = await authRemoteDataSource.sendResetPassword(email);
    return either.fold((l) => Left(l) , (r) => Right(r)
    );
  }

  @override
  Future<Either<Failure, ActiveResetPasswordResponseEntity>> activeResetPassword(String email, String code, String message) async{
    var either = await authRemoteDataSource.activeResetPassword(email, code, message);
    return either.fold((l) =>
      Left(l),(r) => Right(r)
    );
  }

  @override
  Future<Either<Failure, NewPasswordResponseEntity>> newPasswordEntity(String email, String password, String confirmPassword) async{
    var either = await authRemoteDataSource.newPasswordEntity(email, password, confirmPassword);
    return either.fold((l) => Left(l), (r) => Right(r));
  }


}
