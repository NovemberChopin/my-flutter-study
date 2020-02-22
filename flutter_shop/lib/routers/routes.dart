import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './router_handler.dart';

class Routes {
  static String root = '/';
  static String detailsPage = '/detail';
  static String cartPage = '/cart';
  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String,dynamic> params) {
        print('ERROR====>ROUTE WAS NOT FONUND!!!');
        return new Text('ROUTE WAS NOT FONUND');
      }
    );
    // 配置详情页面路由
    router.define(detailsPage, handler: detailsHander);
    router.define(cartPage, handler: cartHander);
  }
}