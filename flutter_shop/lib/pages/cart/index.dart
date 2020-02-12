
import 'package:flutter/material.dart';
import 'package:flutter_shop/model/cartInfo.dart';
import 'package:flutter_shop/pages/cart/cart_Item.dart';
import 'package:flutter_shop/pages/cart/cart_bottom.dart';
import 'package:flutter_shop/provide/cart.dart';
import 'package:provide/provide.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  Future<String> _getCartInfo(BuildContext context) async {
    await Provide.value<CartProvider>(context).getCartInfo();
    return 'end';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
      ),
      body: FutureBuilder(
        future: _getCartInfo(context),
        builder: (context, snapshot) {
          List<CartInfoMode> cartList = Provide.value<CartProvider>(context).cartList;
          if (snapshot.hasData) {
            return Stack(
              children: <Widget>[
                ListView.builder(
                  itemCount: cartList.length,
                  itemBuilder: (context, index) {
                    return CartItem(cartList[index]);
                  },
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: CartBottom(),
                )
              ],
            );
          } else {
            return Text('正在加载');
          }
        },
      ),
    );
  }
}
