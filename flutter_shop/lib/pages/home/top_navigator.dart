import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/goods_model.dart';
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
        // 禁止 GridView 的滚动
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 5,
        padding: EdgeInsets.all(4.0),
        children: navigatorList.map((item) {
          return _gridViewItemUI(context, item);
        }).toList(),
      ),
    );
  }
}