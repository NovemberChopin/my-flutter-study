import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_demo/widgit/layout/align.dart';
import 'package:flutter_demo/widgit/layout/flexAndExpanded.dart';
import 'package:flutter_demo/widgit/layout/rowAndColum.dart';
import 'package:flutter_demo/widgit/layout/stackAndPositioned.dart';
import 'package:flutter_demo/widgit/layout/wrapAndFlow.dart';

class LayoutWidget extends StatelessWidget {
  const LayoutWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // debugPaintSizeEnabled = true;
    return Scaffold(
      appBar: AppBar(title: Text("这是布局 Widget"), centerTitle: true,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("线性布局（Row 和 Column）"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return RowWidget();
                }));
              },
            ),
            RaisedButton(
              child: Text("线性布注意事项"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return RowAndColumn();
                }));
              },
            ),
            RaisedButton(
              child: Text("弹性布局（Flex 和 Expanded）"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FlexWedgit();
                }));
              },
            ),
            RaisedButton(
              child: Text("流式布局-Wrap"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return WrapWidget();
                }));
              },
            ),
            RaisedButton(
              child: Text("流式布局-Flow"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FlowWidget();
                }));
              },
            ),
            RaisedButton(
              child: Text("层叠布局(绝对定位)-Stack Positioned"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return StackWidget();
                }));
              },
            ),
            RaisedButton(
              child: Text("对齐与相对定位-Align"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AlignWidget();
                }));
              },
            ),
          ],
        ),
      )
    );
  }
}