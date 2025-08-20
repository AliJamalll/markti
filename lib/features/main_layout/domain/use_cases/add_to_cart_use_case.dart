import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:markti/core/failures/failure.dart';
import 'package:markti/features/main_layout/domain/entities/add_to_cart_response_entity.dart';
import 'package:markti/features/main_layout/domain/repositories/repository/main_layout_repository.dart';

@injectable
class AddToCartUseCase{
   MainLayoutRepository mainLayoutRepository;
  AddToCartUseCase({required this.mainLayoutRepository});

  Future<Either<Failure,AddToCartResponseEntity>> invoke(String productId)async{
    return await mainLayoutRepository.addToCart(productId);
  }
}