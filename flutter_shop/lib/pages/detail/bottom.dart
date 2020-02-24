import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provide/currentIndex.dart';
import 'package:provide/provide.dart';
import '../../provide/cart.dart';
import '../../provide/details_info.dart';

class DetailsBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) { 
    

    return Container(
      width: ScreenUtil().setWidth(750),
      color: Colors.white,
      height: ScreenUtil().setHeight(80),
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: () {
              // Application.router.navigateTo(context, '/cart');
              Provide.value<CurrentIndexProvider>(context).changeIndex(2);
              Navigator.pop(context);
            },
            child: Container(
              width: ScreenUtil().setWidth(110),
              alignment: Alignment.center,
              child: Icon(
                Icons.shopping_cart,
                size: 35,
                color: Colors.red,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              var goodsId, goodsName, count, price, image;
              var goodsInfo = Provide.value<DetailsInfoProvider>(context).detailsInfo;
              goodsId = goodsInfo.id;
              goodsName = goodsInfo.goodsName;
              count = 1;
              price = goodsInfo.lastPrice;
              image = goodsInfo.imgUrl;
            
              Provide.value<CartProvider>(context).save(goodsId, goodsName, count, price, image);
            },
            child: Container(
              alignment: Alignment.center,
              width: ScreenUtil().setWidth(320),
              height: ScreenUtil().setHeight(80),
              color: Colors.green,
              child: Text(
                '加入购物车',
                style: TextStyle(
                    color: Colors.white, fontSize: ScreenUtil().setSp(28)),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Provide.value<CartProvider>(context).remove();
            },
            child: Container(
              alignment: Alignment.center,
              width: ScreenUtil().setWidth(320),
              height: ScreenUtil().setHeight(80),
              color: Colors.red,
              child: Text(
                '马上购买',
                style: TextStyle(
                    color: Colors.white, fontSize: ScreenUtil().setSp(28)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
