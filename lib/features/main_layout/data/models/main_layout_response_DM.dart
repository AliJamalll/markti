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

  @override
  String toString() {
    return 'MainLayoutResponseDm{list: ${list?.length} items}';
  }

  // Add this method for detailed debugging
  String toDetailedString() {
    return 'MainLayoutResponseDm{\n'
        '  listCount: ${list?.length ?? 0},\n'
        '  items: [\n${list?.map((item) => '    ${item.toString()}').join(',\n') ?? 'null'}\n'
        '  ]\n'
        '}';
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

  @override
  String toString() {
    return 'ListMainLayoutResponseDm{id: $id, title: "$title", price: $price, rating: $rating}';
  }

  // Add this method for detailed debugging
  String toDetailedString() {
    return 'ListMainLayoutResponseDm{\n'
        '  id: $id,\n'
        '  title: "$title",\n'
        '  price: $price,\n'
        '  description: "$description",\n'
        '  images: ${images?.length ?? 0} images,\n'
        '  rating: $rating,\n'
        '  discount: $discount,\n'
        '  remain: $remain,\n'
        '  sold: $sold,\n'
        '  category: "$category",\n'
        '  brand: "$brand",\n'
        '  location: ${location?.toString() ?? "null"},\n'
        '  createdAt: $createdAt,\n'
        '  updatedAt: $updatedAt\n'
        '}';
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

  @override
  String toString() {
    return 'LocationMainLayoutResponseDm{name: "$name", coordinates: ${location?.coordinates}}';
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

  @override
  String toString() {
    return 'LocationResponseDM{type: "$type", coordinates: $coordinates}';
  }
}