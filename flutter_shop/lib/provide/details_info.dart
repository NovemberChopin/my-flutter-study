import 'package:flutter/material.dart';
import 'package:flutter_shop/config/service_url.dart';
import '../model/details_model.dart';
import '../service/service_method.dart';

class DetailsInfoProvider with ChangeNotifier {
  DetailInfo detailsInfo;
  bool isLeft = true;   // 详情页面的 tabar 控制
  bool isRight = false;

  // 从后台获取商品信息
  void getGoodsDetailInfo(String id) async {
    var queryParameters = {
      'appkey': '5wfidtll6t',
      'id': id
    };
    await requestGet(servicePath['getDetailInfo'], param: queryParameters).then((value) {
      // print(value);
      DetailPageData detailPageData = DetailPageData.fromJson(value);
      detailsInfo = detailPageData.info;
      notifyListeners();
    });
  }

  // 改变 tabBar 的状态
  void changeTabBarState(String changeState) {
    if (changeState == 'left') {
      isLeft = true;
      isRight = false;
    } else {
      isLeft = false;
      isRight = true;
    }
    notifyListeners();
  }

  void setTabBarToLrft() {
    isLeft = true;
    isRight = false;

    notifyListeners();
  }
}