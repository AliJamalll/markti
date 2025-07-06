import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:markti/core/failures/failure.dart';
import 'package:markti/features/auth/domain/entities/register_repspons_intity.dart';
import 'package:markti/features/auth/domain/repositories/repository/auth_repository.dart';

@injectable
class RegisterUseCase{
  AuthRepository authRepository;
  RegisterUseCase({required this.authRepository});

  Future<Either<Failure,RegisterResponseEntity>> invoke(
      String name,
      String email,
      String phone,
      String password,
      String confirmPassword,
      ){
    return authRepository.register(name, email, phone, password, confirmPassword);
  }
}