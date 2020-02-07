import 'package:flutter/material.dart';
import '../model/goods_model.dart';

class CategoryGoodsListProvide with ChangeNotifier{
  List<GoodsInfo> goodsList = [];

  getGoodsList(List<GoodsInfo> list) {
    goodsList = list;
    notifyListeners();
  }
}