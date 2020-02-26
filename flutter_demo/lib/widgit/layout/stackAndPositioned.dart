import 'package:flutter/material.dart';

// Stack 允许子组件堆叠，
// 而 Positioned 用于根据 Stack 的四个角来确定子组件的位置。
// 类似于 Web 中的绝对定位

/*
  Stack({
    this.alignment = AlignmentDirectional.topStart,
        决定如何去对齐没有定位（没有使用Positioned）或部分定位的子组件
    this.textDirection,     
        用于确定alignment对齐的参考系
    this.fit = StackFit.loose,  
        用于确定没有定位的子组件如何去适应Stack的大小
    this.overflow = Overflow.clip,
        决定如何显示超出Stack显示空间的子组件
    List<Widget> children = const <Widget>[],
  })

  const Positioned({
    Key key,
    this.left, 
    this.top,
    this.right,
    this.bottom,
    this.width,
    this.height,
    @required Widget child,
  })

  left、top 、right、 bottom分别代表离Stack左、上、右、底四边的距离
  width 和 height 用于指定需要定位元素的宽度和高度。
*/


class StackWidget extends StatelessWidget {
  const StackWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("层叠布局实例"),),
      body: Column(
        children: <Widget>[
          ConstrainedBox(
            //通过ConstrainedBox来确保Stack占满屏幕
            // constraints: BoxConstraints.expand(),
            constraints: BoxConstraints(
              minWidth: double.infinity,
              minHeight: 300.0,
            ),
            child: Stack(
              //指定未定位或部分定位widget的对齐方式
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  // 没有指定定位，并且alignment值为Alignment.center，所以它会居中显示。
                  child: Text("Hello World"),
                  color: Colors.red,
                ),
                Positioned(
                  // 第二个子文本组件Text("I am Jack")只指定了水平方向的定位(left)，
                  // 所以属于部分定位，即垂直方向上没有定位，那么它在垂直方向的对齐方式
                  // 则会按照alignment指定的对齐方式对齐，即垂直方向居中。
                  left: 16.0,
                  child: Text("I am Jack"),
                ),
                Positioned(
                  top: 16.0,
                  child: Text("Your friend"),
                ),
              ],
            ),
          ),
          Expanded(
            // 由于第二个子文本组件没有定位，所以fit属性会对它起作用，就会占满Stack。
            // 由于Stack子元素是堆叠的，所以第一个子文本组件被第二个遮住了，
            // 而第三个在最上层，所以可以正常显示。
            child: Stack(
              alignment: Alignment.center,
              // //未定位widget占满Stack整个空间
              fit: StackFit.expand,
              children: <Widget>[
                Positioned(
                  left: 18.0,
                  child: Text("I am Jack"),
                ),
                Container(child: Text("Hello world",style: TextStyle(color: Colors.white)),
                  color: Colors.red,
                ),
                Positioned(
                  top: 18.0,
                  child: Text("Your friend"),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}


