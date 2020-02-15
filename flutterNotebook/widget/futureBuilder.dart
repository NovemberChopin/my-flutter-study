import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FutureBuilder",
      home: Scaffold(
        appBar: AppBar(title: Text('FutureBuilder'),),
        body: GoogleFutureBuilder(),
      )
    );
  }
}

class GoogleFutureBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var httpClient = new HttpClient();
    Widget waiting = Column(
      children: <Widget>[
        Text('waiting'),
        Icon(Icons.cloud_download),
      ],
    );
    Widget active = Column(
      children: <Widget>[
        Text('active'),
        Icon(Icons.access_time),
      ],
    );
    Widget error = Column(
      children: <Widget>[
        Text('error'),
        Icon(Icons.error),
      ],
    );
    Widget done = Column(
      children: <Widget>[
        Text('done'),
        Icon(Icons.done),
      ],
    );
    Widget none = Column(
      children: <Widget>[
        Text('none'),
        Icon(Icons.filter_none),
      ],
    );
    Dio dio =  Dio();
    String book = 'http://apis.juhe.cn/goodbook/catalog?key=ec12d93e5d98840a0e7a74422aee6296&dtype=json';
    return FutureBuilder(
      future: dio.get(book),
      // future: dio.get('http://127.0.0.1:3000/api/search?keyword=杨晨晨'),
      // future: httpClient.getUrl(Uri.parse('http://cache.video.iqiyi.com/jp/avlist/202861101/1/?callback=jsonp9')),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.done) {
          if (snap.hasError) {
            print(snap.error);
            return error;
          }
          return _createListView(context, snap);
        } else if (snap.connectionState == ConnectionState.active) {
          return active;
        } else if (snap.connectionState == ConnectionState.waiting) {
          return waiting;
        } else if (snap.connectionState == ConnectionState.none) {
          return none;
        }
      },
    );
  }

  Widget _createListView(BuildContext context, AsyncSnapshot snapshot) {
    var books = json.decode(snapshot.data.toString());
    List<Map>  categoryList = (books['result'] as List).cast();
    // print(categoryList);
    return ListView.builder(
      itemBuilder: (context, index) => _itemBuilder(context, categoryList, index),
      itemCount: categoryList.length * 2,
    );
  }

  Widget _itemBuilder(BuildContext context, List<Map> list, int index) {
    if (index.isOdd) {
      return Divider();
    }
    index = index ~/ 2;
    return ListTile(
      title: Text(list[index]['catalog']),
      leading: Text(list[index]['id']),
      // trailing: Text(movies[index]['original_title']),
    );
  }

}
