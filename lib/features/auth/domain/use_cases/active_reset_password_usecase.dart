import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:markti/core/failures/failure.dart';
import 'package:markti/features/auth/domain/entities/active_reset_password_response_entity.dart';
import 'package:markti/features/auth/domain/repositories/repository/auth_repository.dart';

@injectable
class ActiveResetPasswordUseCase{
  AuthRepository authRepository;
  ActiveResetPasswordUseCase({required this.authRepository});

  Future<Either<Failure,ActiveResetPasswordResponseEntity>> invoke(
      String email,
      String code,
      String message,
      )async{
       return authRepository.activeResetPassword(email, code, message);
  }
}