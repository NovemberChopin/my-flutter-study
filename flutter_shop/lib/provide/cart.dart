import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier {
  String cartString = "[]";

  // 添加商品到购物车
  void save(goodsId, goodsName, count, price, image) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    // 把字符串 decode 操作
    var temp = cartString == null ? [] : json.decode(cartString.toString());
    // 转换为 List
    List<Map> tempList = (temp as List).cast();
    var index = 0;
    var isHave = false;   // 判断当前商品是否已添加购物车
    tempList.forEach((element) {
      if (element['goodsId'] == goodsId) {
        tempList[index]['count'] = element['count'] + 1;
        isHave = true;
      }
      index++;
    });
    if (!isHave) {
      tempList.add({
        'goodsId': goodsId,
        'goodsName': goodsName,
        'count': count,
        'price': price,
        'image': image
      });
    }
    // 转化为字符串
    cartString = json.encode(tempList).toString();
    print(cartString);
    // 持久化存储
    prefs.setString('cartInfo', cartString);
  }

  // 清空购物车
  void remove() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('cartInfo');
    print('清空购物车完成');
    notifyListeners();
  }
}