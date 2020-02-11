import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/detail/detail_tabbar.dart';
import 'package:flutter_shop/pages/detail/explain_area.dart';
import 'package:flutter_shop/pages/detail/top_area.dart';
import 'package:flutter_shop/provide/details_info.dart';
import 'package:provide/provide.dart';

class DetailsPage extends StatelessWidget {
  final String goodsId;
  DetailsPage(this.goodsId);
  
  Future _getGoodsInfo(BuildContext context) async {
    Provide.value<DetailsInfoProvider>(context).getGoodsDetailInfo(goodsId);
    return '完成加载';
  }


  @override
  Widget build(BuildContext context) {
    // _getGoodsInfo(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            print('返回上一页');
            Navigator.pop(context);
          },
        ),
        title: Text('商品详情页'),
      ),
      body: FutureBuilder(
        future: _getGoodsInfo(context),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return ListView(
              children: <Widget>[
                DetailsTopArea(),
                DetailsExplain(),
                DetailsTabBar(),
              ],
            );
          } else {
            return Text('加载中...');
          }
        },
      ),
    );
  }
}