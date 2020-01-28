///
/// Flutter 中的按钮
///

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Button",
      home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter Base Component'),
          ),
          body: Column(
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton.icon(
                    icon: Icon(Icons.send),
                    label: Text("发送"),
                    onPressed: () {},
                  ),
                  OutlineButton.icon(
                    icon: Icon(Icons.add),
                    label: Text("添加"),
                    onPressed: () {},
                  ),
                  FlatButton.icon(
                    icon: Icon(Icons.info),
                    label: Text("详情"),
                    onPressed: () {},
                  ),
                  FlatButton(
                    color: Colors.blue,
                    highlightColor: Colors.blue[700],
                    colorBrightness: Brightness.dark, // 保证按钮文字颜色为浅色。
                    splashColor: Colors.grey,
                    child: Text("Submit"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () {},
                  )
                ],
              ),
            ],
          )),
    );
  }
}
