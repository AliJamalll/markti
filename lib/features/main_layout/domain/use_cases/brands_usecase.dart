import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:markti/core/failures/failure.dart';
import 'package:markti/features/main_layout/domain/entities/brand_response_entity.dart';
import 'package:markti/features/main_layout/domain/repositories/repository/main_layout_repository.dart';

@injectable
class BrandsUseCase{
  MainLayoutRepository mainLayoutRepository;
  BrandsUseCase({required this.mainLayoutRepository});

  Future<Either<Failure,BrandResponseEntity>> invoke()async{
    return await mainLayoutRepository.getAllBrands();
  }
}