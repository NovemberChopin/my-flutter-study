import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/cartInfo.dart';

class CartProvider with ChangeNotifier {
  String cartString = "[]";
  List<CartInfoMode> cartList = [];

  double allPrice = 0;
  int allGoodsCount = 0;

  bool isAllCheck = true;

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
        cartList[index].count++;
        isHave = true;
      }
      index++;
    });
    if (!isHave) {
      Map<String, dynamic> newGoods = {
        'goodsId': goodsId,
        'goodsName': goodsName,
        'count': count,
        'price': price,
        'image': image,
        'isCheck': 1
      };
      tempList.add(newGoods);
      cartList.add(CartInfoMode.fromJson(newGoods));
    }
    // 转化为字符串
    cartString = json.encode(tempList).toString();
    print(cartString);
    // 持久化存储
    prefs.setString('cartInfo', cartString);

    await getCartInfo();
  }

  // 得到购物车中的商品
  getCartInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    // 初始化 cartList
    cartList = [];
    // 判断购物车是否有商品
    if (cartString == null) {
      cartList = [];
      isAllCheck = false;
    } else {
      List<Map> tempList = (json.decode(cartString.toString()) as List).cast();

      allPrice = 0;
      allGoodsCount = 0;
      tempList.forEach((element) {
        if (element['isCheck'] == 1) {
          allPrice += element['count'] * double.parse(element['price']);
          allGoodsCount += element['count'];
        } else {
          isAllCheck = false;
        }
        cartList.add(CartInfoMode.fromJson(element));
      });
    }

    notifyListeners();
  }

  // 清空购物车
  void remove() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartList = [];
    prefs.remove('cartInfo');
    print('清空购物车完成'+ "还有数据的数量： " + cartList.length.toString());
    notifyListeners();
  }

  void deleteOneGoods(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    List<Map> tempList = (json.decode(cartString.toString()) as List).cast();

    tempList.removeWhere((element) => element['goodsId'] == id);
    cartString = json.encode(tempList).toString();
    prefs.setString('cartInfo', cartString);
    
    await getCartInfo();
  }

  changeCheckState(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
    int index = tempList.indexWhere((element) => element['goodsId'] == id);
    
    int checkState = tempList[index]['isCheck'];
    tempList[index]['isCheck'] = checkState == 1 ? 0 : 1;

    cartString = json.encode(tempList).toString();
    prefs.setString('cartInfo', cartString);
    
    await getCartInfo();
  }

  changeAllCheckState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
     
    isAllCheck = !isAllCheck;
    int check = isAllCheck == true ? 1 : 0;

    tempList.forEach((element) {element['isCheck'] = check;});
    
    cartString = json.encode(tempList).toString();
    prefs.setString('cartInfo', cartString);
    
    await getCartInfo();
  }
}