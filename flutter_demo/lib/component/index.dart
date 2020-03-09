import 'package:flutter/material.dart';
import 'package:flutter_demo/component/futureBuilder.dart';

class ComponentDemo extends StatefulWidget {
  ComponentDemo({Key key}) : super(key: key);

  @override
  _ComponentDemoState createState() => _ComponentDemoState();
}

class _ComponentDemoState extends State<ComponentDemo> {
  int _currendIndex = 0;
  List<Widget> listPage = List();
  @override
  void initState() {
    listPage 
      ..add(FutureBuilderPage())
      ..add(ScreenShow())
      ..add(ScreenShow())
      ..add(ScreenShow());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listPage[_currendIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currendIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.check_circle), title: Text("FutureBuilder")),
          BottomNavigationBarItem(icon: Icon(Icons.check_circle), title: Text("FutureBuilder")),
          BottomNavigationBarItem(icon: Icon(Icons.check_circle), title: Text("FutureBuilder")),
          BottomNavigationBarItem(icon: Icon(Icons.check_circle), title: Text("FutureBuilder")),
        ],
        onTap: (int index) {
          setState(() {
            _currendIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class ScreenShow extends StatelessWidget {
  
  const ScreenShow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("text"),),
    );
  }
}