import 'package:flutter/material.dart';
import '../service/service_method.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String homePageContent = '正在获取数据';
  @override
  void initState() { 
    super.initState();
    getHomePageContent().then((value) {
      setState(() {
        homePageContent = value.toString();
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('图书分类')),
      body: SingleChildScrollView(
        child: Text(homePageContent),
      )
    );
  }

}
