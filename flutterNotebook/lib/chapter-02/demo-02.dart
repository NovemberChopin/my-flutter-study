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
      home: MyHomePage(),
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
      body: Center(
        child: Text('This is new route'),
      ),
    );
  }
}

// 路由传递参数实例
class TipRoute extends StatelessWidget {
  TipRoute({
    Key key,
    @required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('提示'),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              new Text(text),
              new RaisedButton(
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
        title: Text('非命名路由实例'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
              child: new Text('Open new route page'),
              textColor: Theme.of(context).accentColor,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NewRoute();
                }));
              },
            ),
            new RaisedButton(
              child: new Text('路由传值实例'),
              textColor: Theme.of(context).accentColor,
              onPressed: () async {
                var result = await Navigator.push(context, 
                  MaterialPageRoute(builder: (context) {
                    return TipRoute(
                      // 通过设置参数向打开的路由页面传值
                      text: "我是传入的值",
                    );
                }));
                print("路由返回值：$result");
              },
            )
          ],
        ),
      ),
    );
  }
}
