// 分类 Modle

import 'package:flutter/foundation.dart';

class Category {
  String id;
  String catelog;

  Category({this.id, this.catelog});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      catelog: json['category'],
    );
  }
}

class CategoryModel {
  List<Category> categoryList; // 分类列表

  CategoryModel({this.categoryList});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    var tempList = json['result'] as List;
    List<Category> categoryList =
        tempList.map((e) => Category.fromJson(e)).toList();

    return CategoryModel(categoryList: categoryList);
  }
}

// 返回一级分类内容
List<Category> getCategroyList() {
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
  CategoryModel categoryModel = CategoryModel.fromJson(jsonCategoryData);
  return categoryModel.categoryList;
}
