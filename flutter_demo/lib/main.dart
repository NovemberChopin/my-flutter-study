import 'package:flutter/material.dart';

import './routeDemo/simpleRoute.dart';
import './routeDemo/namedRoute.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      routes: {
        "/": (context) => ShowList(),
        "simpleRoute": (context) => SimpleRoute(),
        "namedRoute": (context) => NamedRoute()
      },
    );
  }
}
const demoList = <String>[
  'simpleRoute',
  'namedRoute',
];
const demoDecrible = <String>[
  "普通命名实例",
  "命名路由实例",
]; 
class ShowList extends StatelessWidget {
  const ShowList({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Demo')),
      body: Container(
        child: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(demoDecrible[index]),
              onTap: () {
                Navigator.pushNamed(context, demoList[index]);
              },
            );
          }, 
          separatorBuilder: (context, index) => Divider(height: 1,), 
          itemCount: demoList.length
        ),
      ),
    );
  }
}
