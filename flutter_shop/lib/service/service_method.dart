import 'package:dio/dio.dart';
import 'dart:async';
import '../config/service_url.dart';

Future getHomePageContent(int page, int pagesize) async{

  try{
    if (pagesize == 10)
      print('。。。正在获取首页数据...............');
    else
      print('。。。正在加载热卖商品数据...............');
    Response response;
    Dio dio = new Dio();
    // dio.options.contentType=ContentType.parse("application/x-www-form-urlencoded");
    // var formData = {'lon':'115.02932','lat':'35.76189'};
    var formData = {
      'appkey': '5wfidtll6t',
      'page': page,
      'pagesize': pagesize,
      'cid': 3
    };
    print(servicePath['homePageContext']);
    response = await dio.get(
      servicePath['homePageContext'],
      queryParameters: formData
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