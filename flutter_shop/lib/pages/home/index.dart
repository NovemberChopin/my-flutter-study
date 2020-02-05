import 'package:flutter/material.dart';

import './swiper_diy.dart';
import './top_navigator.dart';
// import './ad_banner.dart';
import './leader_phone.dart';
import './recommend.dart';
import './floor_goods.dart';
import './hot_goods.dart';

import '../../service/service_method.dart';
import '../../tool/parseJson.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(title: Text('选单网')),
      body: FutureBuilder(
        // 获取第 1 页， 10 条数据
        future: getHomePageContent(1, 10),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            var swiperGoodsData = snapshot.data;
            HomePageData _homePageData = HomePageData.fromJson(swiperGoodsData);
            List<GoodsInfo> homeDataList = _homePageData.indexes;
            // for (var i = 0; i < homeDataList.length; i++) {
            //   print('imgUrl:' + homeDataList[i].imgUrl + '\n');
            // }
            String leaderImager = homeDataList[0].imgUrl;
            String leaderPhone = '18754565971';
            return SingleChildScrollView(
              child: Column(
                children: <Widget> [
                  SwiperDiy(swiperDataList: homeDataList),
                  TopNavigator(navigatorList: homeDataList,),
                  // AdBanner()   // 广告组建
                  LeaderPhone(leaderImage: leaderImager, leaderPhone: leaderPhone,),
                  Recommend(recommendList: homeDataList,),
                  FloorTitle(pictureAddress: homeDataList[0].imgUrl,),
                  FloorContent(floorGoodsList: homeDataList,),
                  HotGoods(),
                ]
              ),
            );
          } else {
            return Center(child: Text('正在加载。。。'));
          }
        },
      ),
    );
  }
}







