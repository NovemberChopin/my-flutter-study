import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:flutter/material.dart';
import '../../service/service_method.dart';
import '../../model/goods_model.dart';

class CategoryGoodsList extends StatefulWidget {
  CategoryGoodsList({Key key}) : super(key: key);

  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {
  List<GoodsInfo> list = [];
  void _getCategoryGoodsList() async {
    await getClassGoodsData(1, 2).then((value) {
      HomePageData categoryGoodsData = HomePageData.fromJson(value);
      List<GoodsInfo> goodsCategoryList = categoryGoodsData.indexes;
      setState(() {
        list = goodsCategoryList;
      });
    });
  }
  
  @override
  void initState() { 
    super.initState();
    _getCategoryGoodsList();
  }

  Widget _goodsImage(index) {
    return Container(
      width: ScreenUtil().setWidth(200),
      child: Image.network(list[index].imgUrl),
    );
  }
  Widget _goodsName(index) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(370),
      child: Text(
        list[index].goodsName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: ScreenUtil().setSp(28)),
      ),
    );
  }
  Widget _goodsPrice(index) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      width: ScreenUtil().setWidth(370),
      child: Row(
        children: <Widget>[
          Text(
            '价格：￥${list[index].lastPrice}',
            style: TextStyle(color:Colors.pink,fontSize:ScreenUtil().setSp(30)),
          ),
          Text(
            '￥${list[index].goodsPrice}',
            style: TextStyle(
              color: Colors.black26,
              decoration: TextDecoration.lineThrough
            ),
          )
        ],
      ),
    );
  }
  Widget _listWidget(int index) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0), 
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 1.0, color: Colors.black12)
          )
        ),
        child: Row(
          children: <Widget>[
            _goodsImage(index),
            Column(
              children: <Widget>[
                _goodsName(index),
                _goodsPrice(index),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(left: 8.0),
      width: ScreenUtil().setWidth(570),
      height: ScreenUtil().setHeight(980),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _listWidget(index);
        },
      ),
    );
  }
}