import 'package:markti/features/main_layout/domain/entities/brand_response_entity.dart';

class BrandResponseDm extends BrandResponseEntity{
  BrandResponseDm({
      super.list,});

  BrandResponseDm.fromJson(dynamic json) {
    if (json['list'] != null) {
      list = [];
      json['list'].forEach((v) {
        list?.add(brandListResponseDM.fromJson(v));
      });
    }
  }
}

class brandListResponseDM extends BrandListResponseEntity{
  brandListResponseDM({
      super.id,
      super.name,
      super.imagePath,
      super.v,});

  brandListResponseDM.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    imagePath = json['imagePath'];
    v = json['__v'];
  }
}