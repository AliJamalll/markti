import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:markti/core/failures/failure.dart';
import 'package:markti/features/auth/domain/entities/send_password_email_entity.dart';
import 'package:markti/features/auth/domain/repositories/repository/auth_repository.dart';

@injectable
class SendPasswordEmailUseCase{
  AuthRepository authRepository;
  SendPasswordEmailUseCase({required this.authRepository});

  Future<Either<Failure,SendPasswordEmailEntity>> invoke(String email){
    return authRepository.sendResetPassword(email);
  }
}