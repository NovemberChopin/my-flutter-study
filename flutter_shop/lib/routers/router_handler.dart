import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../pages/detail/index.dart';
import '../pages/cart/index.dart';

Handler detailsHander = new Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    String goodsId = params['id'][0];
    // print('index>details goodsID is $goodsId');
    return DetailsPage(goodsId);
  }
);

Handler cartHander = new Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return CartPage();
  }
);

