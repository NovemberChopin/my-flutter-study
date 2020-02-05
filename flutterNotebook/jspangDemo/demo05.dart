import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '不规则底部工具栏',
      theme: ThemeData(
        primaryColor: Colors.lightBlue
      ),
      home: BottomAppBarDemo(),
    );
  }
}

class BottomAppBarDemo extends StatefulWidget {
  _BottomAppBarDemoState createState() => _BottomAppBarDemoState();
}
class _BottomAppBarDemoState extends State<BottomAppBarDemo> {
  List<Widget> _eachview;
  int _index = 0;
  @override
  void initState() {
    super.initState();
    _eachview = List();
    _eachview..add(EachView('Home'))..add(EachView('Me'));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _eachview[_index],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext content) {
            return EachView('New Page');
          }));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add, color: Colors.white,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _index = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.airport_shuttle),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _index = 1;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

class EachView extends StatefulWidget {
  // EachView({Key key, @required this._title}) : super(key: key);
  final String _title;
  EachView(this._title);
  @override
  _EachViewState createState() => _EachViewState();
}

class _EachViewState extends State<EachView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget._title),),
      body: Center(child: Text(widget._title),),
    );
  }
}