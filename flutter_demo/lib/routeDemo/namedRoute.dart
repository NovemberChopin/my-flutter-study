// 命名路由实例
import 'package:flutter/material.dart';

class NamedRoute extends StatelessWidget {
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
        "/": (context) => MyHomePage(),
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

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("命名路由"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
              child: Text("无传值的命名路由"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, "new_page1");
              },
            ),
            new FlatButton(
              child: Text("命名路由传值"),
              textColor: Colors.blue,
              onPressed: () async {
                // var result = await Navigator.of(context).pushNamed("new_page2", arguments: "Hi");
                var result = await Navigator.pushNamed(context, "new_page2", arguments: "Hi");
                print("路由返回值：$result");
              },
            ),
          ],
        ),
      ),
    );
  }
}
