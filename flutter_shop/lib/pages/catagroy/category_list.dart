import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/routers/application.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:provide/provide.dart';
import '../../model/goods_model.dart';
import '../../provide/category_goods_list.dart';

class CategoryGoodsList extends StatefulWidget {
  CategoryGoodsList({Key key}) : super(key: key);

  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {
  var scrollController = new ScrollController();
  
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
      onTap: () {
        var id = newList[index].id;
        Application.router.navigateTo(context, '/detail?id=$id');
      },
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

  // 上拉加载功能函数
  void _loadGoodsList(int page, String cid) async {
    await getClassGoodsData(page, cid).then((value) {
      HomePageData categoryGoodsData = HomePageData.fromJson(value);
      List<GoodsInfo> goodsCategoryList = categoryGoodsData.indexes;
      Provide.value<CategoryGoodsListProvide>(context).addGoodsList(goodsCategoryList);
    });
  }

  // 下拉刷新功能函数
  void _onRefreshGoodsList(int page, String cid) async {
    await getClassGoodsData(page, cid).then((value) {
      HomePageData categoryGoodsData = HomePageData.fromJson(value);
      List<GoodsInfo> goodsCategoryList = categoryGoodsData.indexes;
      Provide.value<CategoryGoodsListProvide>(context).getGoodsList(goodsCategoryList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Provide<CategoryGoodsListProvide> (
      builder: (context, child, data) {
        try {
          if(Provide.value<CategoryGoodsListProvide>(context).page == 1) {
            scrollController.jumpTo(0.0);
          }
        } catch(e) {
          print('进入页面第一次初始化：$e');
        }
        if (data.goodsList.length > 0) {
          return Expanded(
            child: Container(
              width: ScreenUtil().setWidth(570),
              child: EasyRefresh(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: data.goodsList.length,
                  itemBuilder: (context, index) {
                    return _listWidget(data.goodsList, index);
                  },
                ),
                onLoad: () async {
                  // print('这是上拉加载');
                  // page++
                  Provide.value<CategoryGoodsListProvide>(context).addPage();
                  // 获取数据 并把数据添加到列表尾部
                  _loadGoodsList(data.page, data.cid);
                },
                onRefresh: () async {
                  // print('这是下拉刷新函数');
                  // page++
                  Provide.value<CategoryGoodsListProvide>(context).addPage();
                  _onRefreshGoodsList(data.page, data.cid);
                },
              )
            ),
          );
        } else {
          return Text('暂时没有数据');
        }
      },
    );
      
  }
}