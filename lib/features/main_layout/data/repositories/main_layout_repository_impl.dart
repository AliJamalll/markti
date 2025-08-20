import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:markti/core/failures/failure.dart';
import 'package:markti/features/main_layout/domain/entities/add_to_cart_response_entity.dart';
import 'package:markti/features/main_layout/domain/entities/brand_response_entity.dart';
import 'package:markti/features/main_layout/domain/entities/main_layout_response_entity.dart';
import 'package:markti/features/main_layout/domain/repositories/data_source/main_layout_remote_data_source/main_layout_remote_data_source.dart';
import 'package:markti/features/main_layout/domain/repositories/repository/main_layout_repository.dart';

import '../../domain/entities/category_response_entity.dart';

@Injectable(as: MainLayoutRepository)
class MainLayoutRepositoryImpl implements MainLayoutRepository{

  MainLayoutRemoteDateSource mainLayoutRemoteDateSource;
MainLayoutRepositoryImpl({required this.mainLayoutRemoteDateSource});

  @override
  Future<Either<Failure, MainLayoutResponseEntity>> getAllProducts()async {
    var either = await mainLayoutRemoteDateSource.getAllProducts();
    return either.fold((e) => Left(e), (r) => Right(r));

  }

  @override
  Future<Either<Failure, CategoryResponseEntity>> getAllCategories() async{
    var either = await mainLayoutRemoteDateSource.getAllCategories();
    return either.fold((e) => Left(e), (r) => Right(r));
  }

  @override
  Future<Either<Failure, BrandResponseEntity>> getAllBrands() async{
   var either = await mainLayoutRemoteDateSource.getAllBrands();
   return either.fold((e) => Left(e), (r) => Right(r));
  }

  @override
  Future<Either<Failure, AddToCartResponseEntity>> addToCart(String productId) async{
    var either = await mainLayoutRemoteDateSource.addToCart(productId);
    return either.fold((e) => Left(e), (r) => Right(r));
  }
}