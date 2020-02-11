// 楼层模块编写

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/goods_model.dart';
import 'package:flutter_shop/routers/application.dart';

class FloorTitle extends StatelessWidget {
  const FloorTitle({Key key, this.pictureAddress}) : super(key: key);
  final String pictureAddress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: InkWell(
        onTap: () {},
        child: Image.network(pictureAddress, fit: BoxFit.cover,),
      )
    );
  }
}

// 楼层商品组件
class FloorContent extends StatelessWidget {
  const FloorContent({Key key, this.floorGoodsList}) : super(key: key);
  final List<GoodsInfo> floorGoodsList;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _firstRow(context),
          _otherGoods(context),
        ],
      ),
    );
  }

  Widget _firstRow(BuildContext context) {
    return Row(
      children: <Widget>[
        _goodsItem(context, floorGoodsList[0]),
        Column(
          children: <Widget>[
            _goodsItem(context, floorGoodsList[1]),
            _goodsItem(context, floorGoodsList[2]),
          ],
        )
      ],
    );
  }

  Widget _otherGoods(BuildContext context) {
    return Row(
      children: <Widget>[
        _goodsItem(context, floorGoodsList[3]),
        _goodsItem(context, floorGoodsList[4]),
      ],
    );
  }

  Widget _goodsItem(BuildContext context, GoodsInfo goods) {
    return Container(
      width: ScreenUtil().setWidth(375),
      child: InkWell(
        onTap: () {
          final id = goods.id;
          Application.router.navigateTo(context, '/detail?id=$id');
        },
        child: Image.network(goods.imgUrl,),
      ),
    );
  }
}