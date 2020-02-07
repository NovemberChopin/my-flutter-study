import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../model/goods_model.dart';
import '../../provide/category_goods_list.dart';

class CategoryGoodsList extends StatefulWidget {
  CategoryGoodsList({Key key}) : super(key: key);

  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {
  
  @override
  void initState() { 
    super.initState();
  }

  Widget _goodsImage(List<GoodsInfo> newList, index) {
    return Container(
      width: ScreenUtil().setWidth(200),
      child: Image.network(newList[index].imgUrl),
    );
  }
  Widget _goodsName(List<GoodsInfo> newList, index) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(370),
      child: Text(
        newList[index].goodsName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: ScreenUtil().setSp(28)),
      ),
    );
  }
  Widget _goodsPrice(List<GoodsInfo> newList, index) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      width: ScreenUtil().setWidth(370),
      child: Row(
        children: <Widget>[
          Text(
            '价格：￥${newList[index].lastPrice}',
            style: TextStyle(color:Colors.pink,fontSize:ScreenUtil().setSp(30)),
          ),
          Text(
            '￥${newList[index].goodsPrice}',
            style: TextStyle(
              color: Colors.black26,
              decoration: TextDecoration.lineThrough
            ),
          )
        ],
      ),
    );
  }
  Widget _listWidget(List<GoodsInfo> newList, int index) {
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
            _goodsImage(newList, index),
            Column(
              children: <Widget>[
                _goodsName(newList, index),
                _goodsPrice(newList, index),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Provide<CategoryGoodsListProvide> (
      builder: (context, child, data) {
        if (data.goodsList.length > 0) {
          return Expanded(
            child: Container(
              // padding: EdgeInsets.only(left: 8.0),
              width: ScreenUtil().setWidth(570),
              child: ListView.builder(
                itemCount: data.goodsList.length,
                itemBuilder: (context, index) {
                  return _listWidget(data.goodsList, index);
                },
              ),
            ),
          );
        } else {
          return Text('暂时没有数据');
        }
      },
    );
      
  }
}