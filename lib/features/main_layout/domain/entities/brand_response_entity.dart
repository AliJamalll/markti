class BrandResponseEntity {
  BrandResponseEntity({
      this.list,});

  List<BrandListResponseEntity>? list;


}

class BrandListResponseEntity {
  BrandListResponseEntity({
      this.id, 
      this.name, 
      this.imagePath, 
      this.v,});

  String? id;
  String? name;
  String? imagePath;
  num? v;


}