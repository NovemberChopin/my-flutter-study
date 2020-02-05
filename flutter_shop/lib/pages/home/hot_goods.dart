import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../service/service_method.dart';
import '../../tool/parseJson.dart';

// 火爆专区部分
class HotGoods extends StatefulWidget {
  HotGoods({Key key}) : super(key: key);

  @override
  _HotGoodsState createState() => _HotGoodsState();
}

class _HotGoodsState extends State<HotGoods> {
  int page = 1;
  List<GoodsInfo> hotDataList = [];

  void _getHotGoods() {
    getHomePageContent(page, 4).then((value) {
      HomePageData _homePageData = HomePageData.fromJson(value);
      List<GoodsInfo> homeDataList = _homePageData.indexes;
      setState(() {
        hotDataList = homeDataList;
        page++;
      });
    });
  }

  //火爆专区标题
  Widget hotTitle = Container(
    margin: EdgeInsets.only(top: 10.0),
    padding: EdgeInsets.all(5.0),
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(width: 0.5, color: Colors.black12))),
    child: Text('火爆专区'),
  );

  //火爆专区子项
  Widget _wrapList(List<GoodsInfo> hotGoodsList) {
    if (hotGoodsList.length != 0) {
      List<Widget> listWidget = hotGoodsList.map((val) {
        return InkWell(
            onTap: () {
              print('点击了火爆商品');
            },
            child: Container(
              width: ScreenUtil().setWidth(372),
              color: Colors.white,
              padding: EdgeInsets.all(5.0),
              margin: EdgeInsets.only(bottom: 3.0),
              child: Column(
                children: <Widget>[
                  Image.network(
                    val.imgUrl,
                    width: ScreenUtil().setWidth(375),
                  ),
                  Text(
                    val.goodsName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.pink, fontSize: ScreenUtil().setSp(26)),
                  ),
                  Row(
                    children: <Widget>[
                      Text('￥${val.lastPrice}'),
                      Text(
                        '￥${val.goodsPrice}',
                        style: TextStyle(
                            color: Colors.black26,
                            decoration: TextDecoration.lineThrough),
                      )
                    ],
                  )
                ],
              ),
            ));
      }).toList();
      return Wrap(
        spacing: 2,
        children: listWidget,
      );
    } else {
      return Text(' ');
    }
  }

  @override
  void initState() {
    super.initState();
    _getHotGoods();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          hotTitle,
          _wrapList(hotDataList)
        ],
      ),
    );
  }
}
