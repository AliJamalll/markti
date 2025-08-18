import 'package:dartz/dartz.dart';
import 'package:markti/core/failures/failure.dart';

import '../../entities/brand_response_entity.dart';
import '../../entities/category_response_entity.dart';
import '../../entities/main_layout_response_entity.dart';

abstract class MainLayoutRepository{

  Future<Either<Failure,MainLayoutResponseEntity>> getAllProducts();
  Future<Either<Failure,CategoryResponseEntity>> getAllCategories();
  Future<Either<Failure,BrandResponseEntity>> getAllBrands();

}