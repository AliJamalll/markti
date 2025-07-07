import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:markti/core/failures/failure.dart';
import 'package:markti/features/auth/domain/entities/new_password_response_entity.dart';
import 'package:markti/features/auth/domain/repositories/repository/auth_repository.dart';
@injectable
class NewPasswordUseCase{
  AuthRepository authRepository;
  NewPasswordUseCase({required this.authRepository});

  Future<Either<Failure,NewPasswordResponseEntity>> invoke(
    String email,
    String password,
    String confirmPassword,
  ) async {
    return await authRepository.newPasswordEntity(
      email,
      password,
      confirmPassword,
    );
  }
}