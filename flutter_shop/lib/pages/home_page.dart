import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:url_launcher/url_launcher.dart';

import '../service/service_method.dart';
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
            String leaderImager = homeDataList[0].imgUrl;
            String leaderPhone = '18754565971';
            return Column(
              children: <Widget>[
                Flexible(
                  child: ListView(
                    children: <Widget> [
                      SwiperDiy(swiperDataList: homeDataList),
                      TopNavigator(navigatorList: homeDataList,),
                      // AdBanner()   // 广告组建
                      LeaderPhone(leaderImage: leaderImager, leaderPhone: leaderPhone,),
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

// 顶上轮波图
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

// 分类导航栏
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

// 广告图片
class AdBanner extends StatelessWidget {
  const AdBanner({Key key, this.advertesPic}) : super(key: key);
  final String advertesPic;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(advertesPic),
    );
  }
}

// 店长电话模块
class LeaderPhone extends StatelessWidget {
  final String leaderImage; //店长图片
  final String leaderPhone; //店长电话

  LeaderPhone({Key key, this.leaderImage,this.leaderPhone}) : super(key: key);

  // 不知为何，不能打电话跳转
  // void _launchUrl() async {
  //   String url = 'tel:'+leaderPhone;
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw '不能访问Could not launch $url';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(200),
      width: ScreenUtil().setWidth(750),
      child: InkWell(
        onTap: () {},
        child: Image.network(leaderImage, fit: BoxFit.cover,),
      ),
    );
  }
}