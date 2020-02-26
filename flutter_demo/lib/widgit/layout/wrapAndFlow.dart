import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// Wrap({
//   ...
//   this.direction = Axis.horizontal,
//   this.alignment = WrapAlignment.start,
//   this.spacing = 0.0,
//   this.runAlignment = WrapAlignment.start,
//   this.runSpacing = 0.0,
//   this.crossAxisAlignment = WrapCrossAlignment.start,
//   this.textDirection,
//   this.verticalDirection = VerticalDirection.down,
//   List<Widget> children = const <Widget>[],
// });

// spacing：主轴方向子widget的间距
// runSpacing：纵轴方向的间距
// runAlignment：纵轴方向的对齐方式

class WrapWidget extends StatelessWidget {
  const WrapWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = true;
    return Scaffold(
      appBar: AppBar(title: Text("流式布局 Wrap"),),
      body: ConstrainedBox(
        // Wrap 的最大宽度取决于所有元素的宽度，所以为了让其占用整个屏幕宽度
        // 使用 BoxConstrain 来限制
        constraints: BoxConstraints(minWidth: double.infinity),
        child: Wrap(
        // 主轴部件对齐方式
        alignment: WrapAlignment.spaceEvenly,
        // 主轴方向部件的间距
        spacing: 8.0,
        // 纵轴部件对齐方式
        runAlignment: WrapAlignment.start,
        // 纵轴方向部件间距
        runSpacing: 4.0,
        children: <Widget>[
          new Chip(
            avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
            label: new Text('Hamilton'),
          ),
          new Chip(
            avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('M')),
            label: new Text('Lafayette'),
          ),
          new Chip(
            avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('H')),
            label: new Text('Mulligan'),
          ),
          new Chip(
            avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
            label: new Text('Laurens'),
          ),
          new Chip(
            avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
            label: new Text('Laurens'),
          ),
        ],
      ),
      )
    );
  }
}

class FlowWidget extends StatelessWidget {
  const FlowWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("流式布局-Flow"),),
      body: Flow(
        delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
        children: <Widget>[
          new Container(width: 80.0, height:80.0, color: Colors.red,),
          new Container(width: 80.0, height:80.0, color: Colors.green,),
          new Container(width: 80.0, height:80.0, color: Colors.blue,),
          new Container(width: 80.0, height:80.0,  color: Colors.yellow,),
          new Container(width: 80.0, height:80.0, color: Colors.brown,),
          new Container(width: 80.0, height:80.0,  color: Colors.purple,),
        ],
      ),
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置  
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: new Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)  
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
         x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  getSize(BoxConstraints constraints){
    //指定Flow的大小  
    return Size(double.infinity,200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}