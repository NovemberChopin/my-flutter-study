import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../tool/parseJson.dart';


// 首页推荐模块
class Recommend extends StatelessWidget {
  final List<GoodsInfo>  recommendList;

  Recommend({Key key, this.recommendList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //  height: ScreenUtil().setHeight(450),
       margin: EdgeInsets.only(top: 10.0),
       child: Column(
         children: <Widget>[
           _titleWidget(),
           _recommedList()
         ],
       ),
    );
  }

  //推荐商品标题
  Widget _titleWidget(){
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10.0, 2.0, 0,5.0),
      decoration: BoxDecoration(
        color:Colors.white,
        border: Border(
          bottom: BorderSide(width:0.5,color:Colors.black12)
        )
      ),
      child:Text(
        '商品推荐',
        style:TextStyle(color:Colors.pink)
        )
    );
  }

  Widget _recommedList(){
    return Container(
      height: ScreenUtil().setHeight(350),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendList.length,
        itemBuilder: (context,index){
          return _item(index);
        },
      ),
    );
  }

  Widget _item(index){
    return InkWell(
      onTap: (){},
      child: Container(
        height: ScreenUtil().setHeight(330),
        width: ScreenUtil().setWidth(250),
        padding: EdgeInsets.all(8.0),
        decoration:BoxDecoration(
          color:Colors.white,
          border:Border(
            left: BorderSide(width:1.5,color:Colors.black12)
          )
        ),
        child: Column(
          children: <Widget>[
            Image.network(recommendList[index].imgUrl),
            Text('￥${recommendList[index].lastPrice}'),
            Text(
              '￥${recommendList[index].goodsPrice}',
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color:Colors.grey
              ),
            )
          ],
        ),
      ),
    );
  }
}