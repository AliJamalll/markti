import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:markti/core/failures/failure.dart';
import 'package:markti/features/auth/domain/entities/login_response_entity.dart';
import 'package:markti/features/auth/domain/repositories/repository/auth_repository.dart';

@injectable
class LoginUseCase{
  AuthRepository authRepository;
  LoginUseCase({required this.authRepository});

  Future<Either<Failure,LoginResponseEntity>> invoke(
      String email,
      String password,
      ){
    return authRepository.login(email, password);
  }
}