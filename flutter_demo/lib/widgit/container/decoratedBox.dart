import 'package:flutter/material.dart';

// const DecoratedBox({
//   Decoration decoration,
//   DecorationPosition position = DecorationPosition.background,
//   Widget child
// })

// BoxDecoration({
//   Color color, //颜色
//   DecorationImage image,//图片
//   BoxBorder border, //边框
//   BorderRadiusGeometry borderRadius, //圆角
//   List<BoxShadow> boxShadow, //阴影,可以指定多个
//   Gradient gradient, //渐变
//   BlendMode backgroundBlendMode, //背景混合模式
//   BoxShape shape = BoxShape.rectangle, //形状
// })

// position：此属性决定在哪里绘制Decoration，它接收DecorationPosition的枚举类型，该枚举类有两个值：
// background：在子组件之后绘制，即背景装饰。
// foreground：在子组件之上绘制，即前景。

class DecoratedWidget extends StatelessWidget {
  const DecoratedWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.red, Colors.orange[700]]), //背景渐变
          borderRadius: BorderRadius.circular(3.0), //3像素圆角
          boxShadow: [ //阴影
            BoxShadow(
              color: Colors.black54,
              offset: Offset(2.0, 2.0),
              blurRadius: 4.0)
          ]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
          child: Text(
            "Login",
            style: TextStyle(color: Colors.white),
          ),
        )),
    );
  }
}
