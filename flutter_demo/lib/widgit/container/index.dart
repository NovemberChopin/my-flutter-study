import 'package:flutter/material.dart';
import 'package:flutter_demo/widgit/container/clip.dart';
import 'package:flutter_demo/widgit/container/constrainedBox.dart';
import 'package:flutter_demo/widgit/container/container.dart';
import 'package:flutter_demo/widgit/container/decoratedBox.dart';

class ContainerWidget extends StatefulWidget {
  ContainerWidget({Key key}) : super(key: key);

  @override
  _ContainerWidgetState createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> with SingleTickerProviderStateMixin {

  TabController _tabController;
  List tabs = ["ConstrainedBox", "DecoratedBox", "Container", "Clip"];
  List<Widget> listWidget = List();

  @override
  void initState() {
    listWidget
      ..add(ConstrainWidget())
      ..add(DecoratedWidget())
      ..add(ContainerDemo())
      ..add(ClipWidget());

    _tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("容器类组件"),
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e,)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: listWidget
      ),
    );
  }
}