/// 命名路由实例
///

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // 注册路由表
      routes: {
        "/": (context) => MyHomePage(
              title: "Flutter Demo Home Page",
            ),
        "new_page1": (context) => NewRoutePage(),
        "new_page2": (context) => EchoRoute()
      },
    );
  }
}

class NewRoutePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Open new route page"),
      ),
      body: Center(
        child: new Text('new route page'),
      ),
    );
  }
}

class EchoRoute extends StatelessWidget {
  EchoRoute({
    Key key,
    this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    // 获取传递的参数
    var text = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text("命名路由传参"),),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              RaisedButton(
                child: Text("Return"),
                onPressed: () => Navigator.pop(context, "I'm return value"),
              )
            ],
          ),
        ),
      ),
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
              style: Theme.of(context).textTheme.headline4,
            ),
            new FlatButton(
              child: Text("命名路由实例"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, "new_page1");
              },
            ),
            new FlatButton(
              child: Text("命名路由传值"),
              textColor: Colors.blue,
              onPressed: () async {
                var result = await Navigator.of(context).pushNamed("new_page2", arguments: "Hi");
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
