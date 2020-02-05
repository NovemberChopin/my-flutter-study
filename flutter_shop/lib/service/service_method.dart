import 'package:dio/dio.dart';
import 'dart:async';
import '../config/service_url.dart';

// 获取首页数据
Future getHomePageData(int page) {
  print('获取首页数据...............');
  var queryParameters = {
      'appkey': '5wfidtll6t',
      'page': page,
      'pagesize': 10,
      'cid': 3          // 商品类型
    };
  return requestGet(servicePath['homePageContext'], param: queryParameters);
}

// 获取首页爆款商品数据
Future getHotGoodsData(int page) {
  print('正在获取热卖商品数据...............');
  var queryParameters = {
      'appkey': '5wfidtll6t',
      'page': page,
      'pagesize': 4,  // 每次加载 4 条数据
      'imgnum': 4,    // 实拍图数量
      'sort': 2,      // 全天销量排序
      'hasvedio': 0,  // 0 不筛选， 1 有
      'haspyq': 0     // 是否有表情文案（0不筛选 1有）
    };
  return requestGet(servicePath['hotGoods'], param: queryParameters);
}

// 获取分类列表数据
Future getCategoryList() {
  var queryParameters = {
    'key': 'ec12d93e5d98840a0e7a74422aee6296',
    'dtype': 'json'
  };
  return requestGet(servicePath['categoryList'], param: queryParameters);
}

// 通用 Get 接口
Future requestGet(String url, {Map param}) async{
  try{
    Response response;
    Dio dio = new Dio();
    print(url);
    response = await dio.get(
      url,
      queryParameters: param
    );
    if(response.statusCode==200){
      return response.data;
    }else{
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  }catch(e){
    return print('ERROR:======>$e');
  }
}