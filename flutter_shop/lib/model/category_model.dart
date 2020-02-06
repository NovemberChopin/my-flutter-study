// 分类 Modle

class SubCategoryModel {
  String id;
  String subCatelog;

  SubCategoryModel({this.id, this.subCatelog});
}
class CategoryModel {
  String id;
  String catelog;
  List<SubCategoryModel> subCategoryList;

  CategoryModel({this.id, this.catelog, this.subCategoryList});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    // 根据父类生成字类
    String id = json['id'];
    String catelog = json['category'];
    List<SubCategoryModel> subList = [];

    for (var i = 0; i < 5; i++) {
      SubCategoryModel subCategory = SubCategoryModel(
        id: id,
        subCatelog: "$catelog$i"
      );
      subList.add(subCategory);
    }

    return CategoryModel(
      id: id,
      catelog: catelog,
      subCategoryList: subList
    );
  }
}

class CategoryList {
  List<CategoryModel> categoryList; // 分类列表

  CategoryList({this.categoryList});

  factory CategoryList.fromJson(Map<String, dynamic> json) {
    var tempList = json['result'] as List;
    List<CategoryModel> categoryList =
        tempList.map((e) => CategoryModel.fromJson(e)).toList();

    return CategoryList(categoryList: categoryList);
  }
}

// 返回一级分类内容
List<CategoryModel> getCategroyList() {
  var jsonCategoryData = {
    "resultcode": "200",
    "reason": "success",
    "result": [
      {"id": "0", "category": "全部"},
      {"id": "1", "category": "女装"},
      {"id": "2", "category": "男装"},
      {"id": "3", "category": "内衣"},
      {"id": "4", "category": "母婴"},
      {"id": "5", "category": "化妆品"},
      {"id": "6", "category": "居家"},
      {"id": "7", "category": "鞋包配饰"},
      {"id": "8", "category": "美食"},
      {"id": "9", "category": "文体车品"},
      {"id": "10", "category": "数据家电"},
    ],
    "error_code": 0
  };
  CategoryList categoryList = CategoryList.fromJson(jsonCategoryData);
  return categoryList.categoryList;
}
