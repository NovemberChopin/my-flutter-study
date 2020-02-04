// 商品详情类
import 'dart:convert';

class GoodsInfo {
  String id; // 商品ID
  String goodsName; // 商品名称
  String goodsClass; // 商品分类
  String imgUrl; // 广告图地址
  String goodsPrice;
  String lastPrice;
  String saleCount; // 总销量
  String allDayCount; // 全天销量
  String tjRemark; // 文案

  GoodsInfo({
    this.id,
    this.goodsName,
    this.goodsClass,
    this.imgUrl,
    this.goodsPrice,
    this.lastPrice,
    this.saleCount,
    this.allDayCount,
    this.tjRemark,
  });

  factory GoodsInfo.fromJson(Map<String, dynamic> json) {
    return GoodsInfo(
        id: json['ID'].toString(),
        goodsName: json['GoodsName'],
        goodsClass: json['GoodsClass'],
        imgUrl: json['ImgUrl'],
        goodsPrice: json['GoodsPrice'].toString(),
        lastPrice: json['LastPrice'].toString(),
        saleCount: json['SaleCount'].toString(),
        allDayCount: json['AllDayCount'].toString(),
        tjRemark: json['TjRemark']);
  }
}

// 首页返回信息
class HomePageData {
  int error; // 返回代码
  int totalNum; // 返回条目
  List<GoodsInfo> indexes; // 商品信息列表

  HomePageData({this.error, this.totalNum, this.indexes});

  factory HomePageData.fromJson(Map<String, dynamic> json) {
    var tempIndex = json['data'] as List;
    List<GoodsInfo> goodsList =
        tempIndex.map((e) => GoodsInfo.fromJson(e)).toList();

    return HomePageData(
        error: json['error'], totalNum: json['total_num'], indexes: goodsList);
  }
}