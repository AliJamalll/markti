import 'package:markti/features/main_layout/domain/entities/add_to_cart_response_entity.dart';

class AddToCartResponseDm extends AddToCartResponseEntity{
  AddToCartResponseDm({
      super.message,});

  AddToCartResponseDm.fromJson(dynamic json) {
    message = json['message'];
  }
  

}