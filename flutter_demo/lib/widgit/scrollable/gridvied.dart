import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // debugPaintSizeEnabled = true;
    return ListView(
      children: <Widget>[
        Text("纵轴子元素为固定数量的 GridView"),
        GridView.count(
          // 禁止 GridView 的滚动
          physics: NeverScrollableScrollPhysics(),
          // 当 GridView 在一个无边界(滚动方向上)的容器中时，shrinkWrap必须为true。
          shrinkWrap: true,
          crossAxisCount: 3, //横轴三个子widget
          childAspectRatio: 1.0, //宽高比为1时，子widget
          children:<Widget>[
            Icon(Icons.ac_unit),
            Icon(Icons.airport_shuttle),
            Icon(Icons.all_inclusive),
            Icon(Icons.beach_access),
            Icon(Icons.cake),
            Icon(Icons.free_breakfast)
          ]
        ),
        Text("纵轴子元素为固定长度的 GridView"),
        GridView.extent(
          // 禁止 GridView 的滚动
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          maxCrossAxisExtent: 140.0,
          childAspectRatio: 1.0, //宽高比为1
          children: <Widget>[
            Icon(Icons.ac_unit),
            Icon(Icons.airport_shuttle),
            Icon(Icons.all_inclusive),
            Icon(Icons.beach_access),
            Icon(Icons.cake),
            Icon(Icons.free_breakfast),
          ],
        )
      ],
    );
  }
}

class InfiniteGridView extends StatefulWidget {
  InfiniteGridView({Key key}) : super(key: key);

  @override
  _InfiniteGridViewState createState() => _InfiniteGridViewState();
}

class _InfiniteGridViewState extends State<InfiniteGridView> {
  List<IconData> _icons = [];
  //模拟异步获取数据
  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access, Icons.cake,
          Icons.free_breakfast
        ]);
      });
    });
  }
  @override
  void initState() {
    // 初始化数据
    _retrieveIcons();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 每行三个元素
        childAspectRatio: 1.0 // 显示区域宽高相等
      ), 
      itemCount: _icons.length,
      itemBuilder: (context, index) {
        if (index == _icons.length - 1 && _icons.length < 200) {
          _retrieveIcons();
        }
        return Icon(_icons[index]);
      }
    );
  }
}