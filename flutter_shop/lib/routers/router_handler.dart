import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../pages/detail/details_page.dart';

Handler detailsHander = new Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    String goodsId = params['id'][0];
    print('index>details goodsID is $goodsId');
    return DetailsPage(goodsId);
  }
);

