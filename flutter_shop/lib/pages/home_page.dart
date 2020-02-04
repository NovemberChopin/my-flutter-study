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
            List<GoodsInfo> homeDataList = _homePageData.indexes;
            // for (var i = 0; i < homeDataList.length; i++) {
            //   print('imgUrl:' + homeDataList[i].imgUrl + '\n');
            // }
            return Column(
              children: <Widget>[
                Flexible(
                  child: ListView(
                    children: <Widget> [
                      SwiperDiy(swiperDataList: homeDataList),
                      TopNavigator(navigatorList: homeDataList,)
                    ]
                  ),
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

class TopNavigator extends StatelessWidget {
  const TopNavigator({Key key, this.navigatorList}) : super(key: key);
  final List<GoodsInfo> navigatorList;

  Widget _gridViewItemUI(BuildContext context, GoodsInfo item) {
    return InkWell(
      onTap: () {print('点击了导航');},
      child: Column(
        children: <Widget> [
          Image.network(item.imgUrl, width: ScreenUtil().setWidth(95)),
          Text(item.goodsClass)
        ]
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(320),
      padding:EdgeInsets.all(3.0),
      child: GridView.count(
        crossAxisCount: 5,
        padding: EdgeInsets.all(4.0),
        children: navigatorList.map((item) {
          return _gridViewItemUI(context, item);
        }).toList(),
      ),
    );
  }
}
