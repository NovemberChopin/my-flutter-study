import 'package:flutter/material.dart';

class ContainerWidget extends StatefulWidget {
  ContainerWidget({Key key}) : super(key: key);

  @override
  _ContainerWidgetState createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> with SingleTickerProviderStateMixin {

  TabController _tabController;
  List tabs = ["ConstrainedBox", "DecoratedBox", "Transform", "Container"];
  List<Widget> listWidget = List();

  @override
  void initState() {
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
        children: tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(e, textScaleFactor: 3.0,),
          );
        }).toList(),
      ),
    );
  }
}