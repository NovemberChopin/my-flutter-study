import 'package:flutter/material.dart';

class ScrolableWidget extends StatefulWidget {
  ScrolableWidget({Key key}) : super(key: key);

  @override
  _ScrolableWidgetState createState() => _ScrolableWidgetState();
}

class _ScrolableWidgetState extends State<ScrolableWidget> {
  int currentIndex = 0;
  List bottomTabs = ["Single", "List", "Grid", "Custom", "Scroll"];
  List<Widget> list = List();
  @override
  void initState() {
    list = bottomTabs.map((e) => ScreenShow(text: e,)).toList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("可滚动组件"),),
      body: list[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.event_available), title: Text("Single")),
          BottomNavigationBarItem(icon: Icon(Icons.list), title: Text("List")),
          BottomNavigationBarItem(icon: Icon(Icons.grid_on), title: Text("Grid")),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("Custom")),
          BottomNavigationBarItem(icon: Icon(Icons.scatter_plot), title: Text("Scroll")),

        ],
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        type:BottomNavigationBarType.fixed,
      ),
    );
  }
}

class ScreenShow extends StatelessWidget {
  final String text;
  const ScreenShow({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text, textScaleFactor: 3.0,),
    );
  }
}