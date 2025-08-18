class CategoryResponseEntity {
  CategoryResponseEntity({
      this.list,});

  List<CategoryListEntity>? list;


}

class CategoryListEntity {
  CategoryListEntity({
      this.id, 
      this.name, 
      this.imagePath, 
      this.v,});

  String? id;
  String? name;
  String? imagePath;
  num? v;


}