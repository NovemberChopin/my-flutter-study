import 'package:dio/dio.dart';
import 'dart:async';
import '../config/service_url.dart';

Future getHomePageContent() async{

  try{
    print('开始获取首页数据...............');
    Response response;
    Dio dio = new Dio();
    // dio.options.contentType=ContentType.parse("application/x-www-form-urlencoded");
    // var formData = {'lon':'115.02932','lat':'35.76189'};
    var formData = {
      'key': 'ec12d93e5d98840a0e7a74422aee6296',
      'dtype': 'json'
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
    return print('ERROR:======>${e}');
  }

}