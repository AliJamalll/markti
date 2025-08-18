import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:markti/core/failures/failure.dart';
import 'package:markti/features/main_layout/domain/entities/main_layout_response_entity.dart';
import 'package:markti/features/main_layout/domain/repositories/repository/main_layout_repository.dart';

import '../entities/category_response_entity.dart';

@injectable
class CategoryUseCase {
  MainLayoutRepository mainLayoutRepository;
  CategoryUseCase({required this.mainLayoutRepository});

  Future<Either<Failure,CategoryResponseEntity>> invoke()async{
    return await mainLayoutRepository.getAllCategories();
  }
}