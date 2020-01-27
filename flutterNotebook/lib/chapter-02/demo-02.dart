/// 非命名路由实例

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// 添加路由页面
class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Route Page'),
      ),
      body: Center(child: Text('This is new route'),),
    );
  }
}

// 路由传递参数实例
class TipRoute extends StatelessWidget {
  TipRoute({Key key, @required this.text,}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text('提示'),),
      body: Padding(padding: EdgeInsets.all(18), child: Center(
        child: Column(children: <Widget>[
          new Text(text),
          new RaisedButton(
            child: Text("Return"),
            onPressed: () => Navigator.pop(context, "I'm return value"),
          )
        ],),
      ),),
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            new FlatButton(
              child: new Text('Open new route page'),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NewRoute();
                }));
              },
            ),
            new FlatButton(
              child: new Text('路由传值实例'),
              textColor: Colors.blue,
              onPressed: () async {
                var result = await Navigator.push(context, 
                  MaterialPageRoute(builder: (context) {
                    return TipRoute(text: "我是提示XXX",);
                  })
                );
                print("路由返回值：$result");
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
