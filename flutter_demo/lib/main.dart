import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_demo/component/index.dart';

import 'package:flutter_demo/component/nav_bottom.dart';
import 'package:flutter_demo/widgit/container/index.dart';
import 'package:flutter_demo/widgit/layout/index.dart';
import 'package:flutter_demo/widgit/scrollable/index.dart';

import './routeDemo/simpleRoute.dart';
import './routeDemo/namedRoute.dart';
import './officeDemo/friendlyChat.dart';
import './officeDemo/layoutDemo.dart';
import './officeDemo/randomWords.dart';

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
        "namedRoute": (context) => NamedRoute(),
        "friendlyChat": (context) => FriendlyChat(),
        "layoutDemo": (context) => LayoutDemo(),
        "randomWords": (context) => RandomWords(),
        "bottomNav": (context) => BottomNav(),
        "layout": (context) => LayoutWidget(),
        "container": (context) => ContainerWidget(),
        "scrolable": (context) => ScrolableWidget(),
        "component": (context) => ComponentDemo()
      },
    );
  }
}
const demoList = <String>[
  'simpleRoute',
  'namedRoute',
  'friendlyChat',
  'layoutDemo',
  'randomWords',
  'bottomNav',
  'layout',
  'container',
  'scrolable',
  'component',
];
const demoDecrible = <String>[
  "普通命名实例",
  "命名路由实例",
  "官方实例1：Friendly Chat App",
  "官方实例2：Layout Demo",
  "官方实例3：Random Words",
  "导航栏",
  "布局组件",
  "容器类组件",
  "可滚动组件",
  "功能组件",
]; 
class ShowList extends StatelessWidget {
  const ShowList({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
        // 自定义 leading 
        // leading: Builder(builder: (context) {
        //   return IconButton(
        //     icon: Icon(Icons.dashboard),
        //     onPressed: () { Scaffold.of(context).openDrawer(); },
        //   );
        // },),
      ),
      drawer: MyDrawer(),
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

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // debugPaintSizeEnabled = true;
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        // removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset('images/avater.jpg', width: 80.0)
                    ),
                  ),
                  Text("盐的甜", style: TextStyle(fontWeight: FontWeight.bold),)
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage account'),
                  ),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
