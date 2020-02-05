// 分类 Modle

class Category {
  String id;
  String catelog;

  Category({this.id, this.catelog});

  factory Category.fromJson(Map<String, dynamic> json) {
    
    return Category(
      id: json['id'],
      catelog: json['catalog'],
    );
  }
}

class CategoryModel {
  
  List<Category> categoryList; // 分类列表

  CategoryModel({this.categoryList});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    var tempList = json['result'] as List;
    List<Category> categoryList = tempList.map((e) => Category.fromJson(e)).toList();

    return CategoryModel(categoryList: categoryList);
  }
}
