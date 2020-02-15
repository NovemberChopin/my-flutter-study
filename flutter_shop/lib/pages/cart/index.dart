
import 'package:flutter/material.dart';
import 'package:flutter_shop/model/cartInfo.dart';
import 'package:flutter_shop/pages/cart/cart_Item.dart';
import 'package:flutter_shop/pages/cart/cart_bottom.dart';
import 'package:flutter_shop/provide/cart.dart';
import 'package:provide/provide.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  Future _getCartInfo(BuildContext context) async {
    await Provide.value<CartProvider>(context).getCartInfo();
    return Provide.value<CartProvider>(context).cartList;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
      ),
      body: FutureBuilder(
        future: _getCartInfo(context),
        builder: _buildFuture
      ) 
    );
  }

  Widget _buildFuture(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasError) {
        print(snapshot.error);
        return Column(
          children: <Widget>[
            Text('error'),
            Icon(Icons.error),
          ],
        );
      }
      return _createListView(context, snapshot);
    } else {
      return CircularProgressIndicator();
    }
  }

  Widget _createListView(BuildContext context, AsyncSnapshot snapshot) {
    List<CartInfoMode> cartList = Provide.value<CartProvider>(context).cartList;
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
  }
}
