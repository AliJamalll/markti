class GetProductsResponseEntity {
  GetProductsResponseEntity({
      this.list,});

  List<ListProductsResponseEntity>? list;


}

class ListProductsResponseEntity {
  ListProductsResponseEntity({
      this.locationResponseEntity,
      this.id, 
      this.title, 
      this.price, 
      this.description, 
      this.images, 
      this.rating, 
      this.discount, 
      this.remain, 
      this.sold, 
      this.category, 
      this.brand, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  LocationResponseEntity? locationResponseEntity;
  String? id;
  String? title;
  num? price;
  String? description;
  List<String>? images;
  num? rating;
  num? discount;
  num? remain;
  num? sold;
  String? category;
  String? brand;
  String? createdAt;
  String? updatedAt;
  num? v;


}

class LocationResponseEntity {
  LocationResponseEntity({
      this.location, 
      this.name,});

  LocationEntity? location;
  String? name;


}

class LocationEntity {
  LocationEntity({
      this.type, 
      this.coordinates,});

  String? type;
  List<num>? coordinates;


}