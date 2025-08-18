import 'package:markti/features/main_layout/domain/entities/category_response_entity.dart';

class CategoryResponseDm extends CategoryResponseEntity{
  CategoryResponseDm({
    super.list,});

  CategoryResponseDm.fromJson(dynamic json) {
    if (json['list'] != null) {
      list = [];
      json['list'].forEach((v) {
        list?.add(CategoryListDM.fromJson(v));
      });
    }
  }

  @override
  String toString() {
    return 'CategoryResponseDm{list: ${list?.length} categories}';
  }

  // Add this method for detailed debugging
  String toDetailedString() {
    return 'CategoryResponseDm{\n'
        '  categoryCount: ${list?.length ?? 0},\n'
        '  categories: [\n${list?.map((category) => '    ${category.toString()}').join(',\n') ?? 'null'}\n'
        '  ]\n'
        '}';
  }
}

class CategoryListDM extends CategoryListEntity {
  CategoryListDM({
    super.id,
    super.name,
    super.imagePath,
    super.v,});

  CategoryListDM.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    imagePath = json['imagePath'];
    v = json['__v'];
  }

  @override
  String toString() {
    return 'CategoryListDM{id: $id, name: "$name", images: ${imagePath?.length ?? 0}}';
  }

  // Add this method for detailed debugging
  String toDetailedString() {
    return 'CategoryListDM{\n'
        '  id: $id,\n'
        '  name: "$name",\n'
        '  imagePath: $imagePath,\n'
        '  imageCount: ${imagePath?.length ?? 0},\n'
        '  v: $v\n'
        '}';
  }
}