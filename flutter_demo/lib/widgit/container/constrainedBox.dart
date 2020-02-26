import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// const BoxConstraints({
//   this.minWidth = 0.0, //最小宽度
//   this.maxWidth = double.infinity, //最大宽度
//   this.minHeight = 0.0, //最小高度
//   this.maxHeight = double.infinity //最大高度
// })
// const BoxConstraints.expand()可以生成一个尽可能大的用以填充另一个容器的BoxConstraints。
// BoxConstraints.tight(Size size)，它可以生成给定大小的限制；
class ConstrainWidget extends StatelessWidget {
  const ConstrainWidget({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // debugPaintSizeEnabled = true;
    Widget redBox = DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
    );

    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // TODO 不明白为啥此时 Text 组件会居中显示
        Text("ConstrainedBox", style: TextStyle(fontWeight: FontWeight.bold),),
        ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: double.infinity,
            minHeight: 50.0,
          ),
          child: Container(
            height: 5.0,
            child: redBox
          ),
        ),
        Text("SizedBox用于给子元素指定固定的宽高"),
        SizedBox(
          width: 80.0,
          height: 80.0,
          child: redBox
        ),
        // 等价于如下写法
        ConstrainedBox(
          constraints: BoxConstraints.tightFor(width: 80.0, height: 80.0),
          // BoxConstraints(minHeight: 80.0,maxHeight: 80.0,minWidth: 80.0,maxWidth: 80.0)
          child: redBox,
        ),
        Text("有多重限制时，对于minWidth和minHeight来说，是取父子中相应数值较大的"),

      ],
    );
  }
}
