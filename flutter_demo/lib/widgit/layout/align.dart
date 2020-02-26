
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/*
 * Align 组件可以调整子组件的位置，
 * 并且可以根据子组件的宽高来确定自身的的宽高，定义如下：
 * Align({
 *  Key key,
 *  this.alignment = Alignment.center,
 *  this.widthFactor,
 *  this.heightFactor,
 *  Widget child,
 * })
 */

class AlignWidget extends StatelessWidget {
  const AlignWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // debugPaintSizeEnabled = true;
    return Scaffold(
      appBar: AppBar(title: Text("Align对齐与相对定位"),),
      body: Column(
        children: <Widget>[
          Container(
            height: 120.0,
            width: 120.0,
            color: Colors.blue[50],
            child: Align(
              alignment: Alignment.topRight,
              child: FlutterLogo(size: 60,),
            ),
          ),
          Container(
            color: Colors.blue[50],
            child: Align(
              widthFactor: 2,
              heightFactor: 2,
              alignment: Alignment.topRight,
              child: FlutterLogo(size: 60,),
            ),
          ),
          Text("Alignment"),
          Container(
            color: Colors.blue[50],
            child: Align(
              widthFactor: 2,
              heightFactor: 2,
              alignment: Alignment(2, 0),
              child: FlutterLogo(size: 60,),
            ),
          ),
          Text("FractionalOffset"),
          Container(
            color: Colors.blue[50],
            child: Align(
              widthFactor: 2,
              heightFactor: 2,
              alignment: FractionalOffset(1, 1),
              child: FlutterLogo(size: 60,),
            ),
          ),
        ],
      )
    );
  }
}