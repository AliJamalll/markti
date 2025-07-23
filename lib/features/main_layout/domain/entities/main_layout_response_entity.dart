class MainLayoutResponseEntity {
  MainLayoutResponseEntity({
      this.list,});

  List<ListMainLayoutResponseEntity>? list;

}

class ListMainLayoutResponseEntity {
  ListMainLayoutResponseEntity({
      this.location, 
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

  LocationMainLayoutResponseEntity? location;
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

class LocationMainLayoutResponseEntity {
  LocationMainLayoutResponseEntity({
      this.location, 
      this.name,});

  LocationResponseEntity? location;
  String? name;


}

class LocationResponseEntity {
  LocationResponseEntity({
      this.type, 
      this.coordinates,});

  String? type;
  List<num>? coordinates;


}