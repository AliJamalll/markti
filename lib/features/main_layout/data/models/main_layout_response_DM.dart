import 'package:markti/features/main_layout/domain/entities/main_layout_response_entity.dart';

class MainLayoutResponseDm extends MainLayoutResponseEntity{
  MainLayoutResponseDm({
      super.list,});

  MainLayoutResponseDm.fromJson(dynamic json) {
    if (json['list'] != null) {
      list = [];
      json['list'].forEach((v) {
        list?.add(ListMainLayoutResponseDm.fromJson(v));
      });
    }
  }


}

class ListMainLayoutResponseDm extends ListMainLayoutResponseEntity {
  ListMainLayoutResponseDm({
      super.location,
      super.id,
      super.title,
      super.price,
      super.description,
      super.images,
      super.rating,
      super.discount,
      super.remain,
      super.sold,
      super.category,
      super.brand,
      super.createdAt,
      super.updatedAt,
      super.v,});

  ListMainLayoutResponseDm.fromJson(dynamic json) {
    location = json['location'] != null ? LocationMainLayoutResponseDm.fromJson(json['location']) : null;
    id = json['_id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    rating = json['rating'];
    discount = json['discount'];
    remain = json['remain'];
    sold = json['sold'];
    category = json['category'];
    brand = json['brand'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }



}

class LocationMainLayoutResponseDm extends LocationMainLayoutResponseEntity {
  LocationMainLayoutResponseDm({
      super.location,
      super.name,});

  LocationMainLayoutResponseDm.fromJson(dynamic json) {
    location = json['location'] != null ? LocationResponseDM.fromJson(json['location']) : null;
    name = json['name'];
  }



}

class LocationResponseDM extends LocationResponseEntity {
  LocationResponseDM({
      super.type,
      super.coordinates,});

  LocationResponseDM.fromJson(dynamic json) {
    type = json['type'];
    coordinates = json['coordinates'] != null ? json['coordinates'].cast<num>() : [];
  }



}