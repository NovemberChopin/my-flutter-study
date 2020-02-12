class DetailInfo {
  String id; // 商品ID
  String goodsName; // 商品名称
  String goodsClass; // 商品分类
  String imgUrl; // 广告图地址
  String goodsPrice;
  String lastPrice;
  String saleCount; // 总销量
  String allDayCount; // 全天销量
  String tjRemark; // 文案
  String pyqRemark;   // html 文案
  List<String> realImg;

  DetailInfo({
    this.id,
    this.goodsName,
    this.goodsClass,
    this.imgUrl,
    this.goodsPrice,
    this.lastPrice,
    this.saleCount,
    this.allDayCount,
    this.tjRemark,
    this.pyqRemark,
    this.realImg,
  });

  factory DetailInfo.fromJson(Map<String, dynamic> json) {
    List<String> realImage = [];
    if (json['RealImg'] != null)
      realImage.add(json['RealImg']);
    if (json['RealImg2'] != null)
      realImage.add(json['RealImg2']);
    if (json['RealImg3'] != null)
      realImage.add(json['RealImg3']);
    if (json['RealImg4'] != null)
      realImage.add(json['RealImg4']);
    if (json['RealImg5'] != null)
      realImage.add(json['RealImg5']);
    if (json['RealImg6'] != null)
      realImage.add(json['RealImg6']);

    return DetailInfo(
      id: json['GoodsId'].toString(),
      goodsName: json['GoodsName'],
      goodsClass: json['GoodsClass'],
      imgUrl: json['ImgUrl'],
      goodsPrice: json['GoodsPrice'].toString(),
      lastPrice: json['LastPrice'].toString(),
      saleCount: json['SaleCount'].toString(),
      allDayCount: json['AllDayCount'].toString(),
      tjRemark: json['TjRemark'],
      pyqRemark: json['PyqRemark'],
      realImg: realImage,
    );
  }
}

// 首页返回信息
class DetailPageData {
  int error; // 返回代码
  int totalNum; // 返回条目
  DetailInfo info; // 商品信息列表

  DetailPageData({this.error, this.totalNum, this.info});

  factory DetailPageData.fromJson(Map<String, dynamic> json) {
    var tempIndex = json['data'] as List;
    // DetailInfo goodDetails = DetailInfo.fromJson(json['data']);
    List<DetailInfo> goodDetails =
        tempIndex.map((e) => DetailInfo.fromJson(e)).toList();
    return DetailPageData(
        error: json['error'], totalNum: json['total_num'], info: goodDetails[0]);
  }
}