import 'package:flutter/material.dart';
import '../model/category_model.dart';

class SubCategoryProvider with ChangeNotifier {
  List<SubCategoryModel> subCategoryList = [];

  void getSubCategoryList(List<SubCategoryModel> list) {
    subCategoryList = list;
    notifyListeners();
  }
}