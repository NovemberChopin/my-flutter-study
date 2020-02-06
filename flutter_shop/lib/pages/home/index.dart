import 'package:flutter/material.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';

import './swiper_diy.dart';
import './top_navigator.dart';
// import './ad_banner.dart';
import './leader_phone.dart';
import './recommend.dart';
import './floor_goods.dart';
import './hot_goods.dart';

import '../../service/service_method.dart';
import '../../model/goods_model.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  
  int page = 1;   // 火爆专区页面
  List<GoodsInfo> hotGoodsList = [];

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(title: Text('选单网')),
      body: FutureBuilder(
        // 获取第 1 页， 10 条数据
        future: getHomePageData(page),
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
            return EasyRefresh(
              child: ListView(
                children: <Widget> [
                  SwiperDiy(swiperDataList: homeDataList),
                  TopNavigator(navigatorList: homeDataList,),
                  // AdBanner()   // 广告组建
                  LeaderPhone(leaderImage: leaderImager, leaderPhone: leaderPhone,),
                  Recommend(recommendList: homeDataList,),
                  FloorTitle(pictureAddress: homeDataList[0].imgUrl,),
                  FloorContent(floorGoodsList: homeDataList,),
                  HotGoods(page: page, hotDataList: hotGoodsList,),
                ]
              ),
              onRefresh: () async {
                print('这是刷新回调函数');
                setState(() {
                  hotGoodsList = [];
                  page++;
                });
              },
              onLoad: () async {
                print('加载回调函数');
                getHotGoodsData(page).then((value) {
                  HomePageData _homePageData = HomePageData.fromJson(value);
                  List<GoodsInfo> homeDataList = _homePageData.indexes;
                  setState(() {
                    hotGoodsList.addAll(homeDataList);
                    page++;
                  });
                });
              },
            );
              
          } else {
            return Center(child: Text('正在加载。。。'));
          }
        },
      ),
    );
  }
}







