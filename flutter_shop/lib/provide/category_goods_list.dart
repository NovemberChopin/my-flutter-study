import 'package:flutter/material.dart';
import '../model/goods_model.dart';

class CategoryGoodsListProvide with ChangeNotifier{
  List<GoodsInfo> goodsList = [];   // 当前商品列表数据
  var page = 1; // 当前列表是第几页
  String cid = "0";  // 当前列表类别

  getGoodsList(List<GoodsInfo> list) {
    goodsList.removeWhere((element) => false);
    goodsList = list;
    // print( "cid >> " + cid + "  page >> " + page.toString() + " 列表长度为 >> " + goodsList.length.toString());
    notifyListeners();
  }

  addGoodsList(List<GoodsInfo> list) {
    goodsList.addAll(list);
    // print( "cid >> " + cid + "  page >> " + page.toString() + " 列表长度为 >> " + goodsList.length.toString());
    notifyListeners();
  }
  void setPage(int page) {
    this.page = page;
  }
  void addPage() {
    page++;
  }

  void setCid(String cid) {
    this.cid = cid;
  }
}