import 'package:flutter/material.dart';
import 'package:flutter_shop/config/service_url.dart';
import '../model/goods_model.dart';
import '../service/service_method.dart';

class DetailsInfoProvider with ChangeNotifier {
  GoodsInfo detailsInfo;

  // 从后台获取商品信息
  void getGoodsDetailInfo(String id) {
    var queryParameters = {
      'appkey': '5wfidtll6t',
      'id': id
    };
    requestGet(servicePath['getDetailInfo'], param: queryParameters).then((value) {
      // print(value);
      HomePageData homePageData = HomePageData.fromJson(value);
      detailsInfo = homePageData.indexes[0];
      notifyListeners();
    });
  }
}