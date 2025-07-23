import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:markti/core/failures/failure.dart';
import 'package:markti/features/main_layout/domain/entities/main_layout_response_entity.dart';

import '../repositories/repository/main_layout_repository.dart';

@injectable
class MainLayoutUseCase{
  MainLayoutRepository mainLayoutRepository;
  MainLayoutUseCase({required this.mainLayoutRepository});

  Future<Either<Failure,MainLayoutResponseEntity>> invoke()async{
    return await mainLayoutRepository.getAllProducts();
  }
}