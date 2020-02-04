import 'package:flutter/material.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../tool/parseJson.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('选单网')),
      body: FutureBuilder(
        future: getHomePageContent(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            var swiperGoodsData = snapshot.data;
            HomePageData _homePageData = HomePageData.fromJson(swiperGoodsData);
            List<GoodsInfo> swiperDataList = _homePageData.indexes;
            // for (var i = 0; i < swiperDataList.length; i++) {
            //   print('imgUrl:' + swiperDataList[i].imgUrl + '\n');
            // }
            return Column(
              children: <Widget>[
                Flexible(
                  child: SwiperDiy(swiperDataList: swiperDataList,),
                ),
              ],
            );
          } else {
            return Center(child: Text('正在加载。。。'));
          }
        },
      ),
    );
  }

}

class SwiperDiy extends StatelessWidget {
  const SwiperDiy({Key key, this.swiperDataList}) : super(key: key);
  final List<GoodsInfo> swiperDataList;

  @override
  Widget build(BuildContext context) {
    //设置适配尺寸 (填入设计稿中设备的屏幕尺寸) 此处假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Container(
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemBuilder: (BuildContext content, int index) {
          return Image.network(swiperDataList[index].imgUrl, fit: BoxFit.cover,);
        },
        itemCount: swiperDataList.length,
        pagination: new SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}
