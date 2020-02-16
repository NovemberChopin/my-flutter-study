import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/pages/cart/cart_count.dart';
import 'package:flutter_shop/provide/cart.dart';
import 'package:provide/provide.dart';
import '../../model/cartInfo.dart';

class CartItem extends StatelessWidget {
  final CartInfoMode item;
  CartItem(this.item);

  @override
  Widget build(BuildContext context) {
    // print(item);
    return Container(
      margin: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
      padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: Row(
        children: <Widget>[
          _cartCheckBt(item),
          _cartImage(item),
          _cartGoodsName(item),
          _cartPrice(context, item)
        ],
      ),
    );
  }

  //多选按钮
  Widget _cartCheckBt(item) {
    return Container(
      child: Checkbox(
        value: item.isCheck == 1 ? true : false,
        activeColor: Colors.pink,
        onChanged: (bool val) {},
      ),
    );
  }

  //商品图片
  Widget _cartImage(item) {
    return Container(
      width: ScreenUtil().setWidth(150),
      padding: EdgeInsets.all(3.0),
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.black12)),
      child: Image.network(item.image),
    );
  }

  //商品名称
  Widget _cartGoodsName(item) {
    return Container(
      width: ScreenUtil().setWidth(350),
      padding: EdgeInsets.all(10),
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[
          Text(item.goodsName),
          CartCount(),
        ],
      ),
    );
  }

  //商品价格
  Widget _cartPrice(BuildContext context, CartInfoMode item) {
    return Container(
      width: ScreenUtil().setWidth(100),
      alignment: Alignment.centerRight,
      child: Column(
        children: <Widget>[
          Text('￥${item.price}'),
          Container(
            child: InkWell(
              onTap: () {
                Provide.value<CartProvider>(context).deleteOneGoods(item.goodsId);
              },
              child: Icon(
                Icons.delete_forever,
                color: Colors.black26,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
