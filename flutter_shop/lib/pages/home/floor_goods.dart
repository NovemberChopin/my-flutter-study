// 楼层模块编写

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/tool/parseJson.dart';

class FloorTitle extends StatelessWidget {
  const FloorTitle({Key key, this.pictureAddress}) : super(key: key);
  final String pictureAddress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: Image.network(pictureAddress, fit: BoxFit.cover,),
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
          _firstRow(),
          _otherGoods(),
        ],
      ),
    );
  }

  Widget _firstRow() {
    return Row(
      children: <Widget>[
        _goodsItem(floorGoodsList[0]),
        Column(
          children: <Widget>[
            _goodsItem(floorGoodsList[1]),
            _goodsItem(floorGoodsList[2]),
          ],
        )
      ],
    );
  }

  Widget _otherGoods() {
    return Row(
      children: <Widget>[
        _goodsItem(floorGoodsList[3]),
        _goodsItem(floorGoodsList[4]),
      ],
    );
  }

  Widget _goodsItem(GoodsInfo goods) {
    return Container(
      width: ScreenUtil().setWidth(375),
      child: InkWell(
        onTap: () {print('点击楼层商品');},
        child: Image.network(goods.imgUrl),
      ),
    );
  }
}