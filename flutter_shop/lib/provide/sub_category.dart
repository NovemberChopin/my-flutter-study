import 'package:flutter/material.dart';
import '../model/category_model.dart';

class SubCategoryProvider with ChangeNotifier {
  List<SubCategoryModel> subCategoryList = [];

  // 点击大类时更换子类信息
  void getSubCategoryList(List<SubCategoryModel> list) {
    subCategoryList = list;
    notifyListeners();
  }
}