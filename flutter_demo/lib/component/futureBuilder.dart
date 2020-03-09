import 'dart:async';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class FutureBuilderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FutureBuilderState();
}

class FutureBuilderState extends State<FutureBuilderPage> {
  String title = 'FutureBuilder使用';
  Future _futureBuilderFuture;
  List _words = [];

  Future _gerData() {
    return Future.delayed(Duration(seconds: 2), () {
      return generateWordPairs().take(20).map((e) => e.asPascalCase).toList();
    });
  }
  // 设置数据
  void _setData() async {
    List items = await _gerData();
    setState(() {
      _words.addAll(items);
    });
  }
  @override
  void initState() {
    _futureBuilderFuture = _gerData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            title = title + '*';
          });
          _words.removeRange(0, 10);
        },
        child: Icon(Icons.title),
      ),
    body: FutureBuilder(
        builder: _buildFuture,
        future: _futureBuilderFuture, // 用户定义的需要异步执行的代码，类型为Future<String>或者null的变量或函数
      ),
    );
  }

  ///snapshot就是_calculation在时间轴上执行过程的状态快照
  Widget _buildFuture(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        print('还没有开始网络请求');
        return Text('还没有开始网络请求');
      case ConnectionState.active:
        print('active');
        return Text('ConnectionState.active');
      case ConnectionState.waiting:
        // print('waiting');
        return Center(
          child: CircularProgressIndicator(),
        );
      case ConnectionState.done:
        // print('done');
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');
        return _createListView(context, snapshot);
      default:
        return null;
    }
  }


  Widget _createListView(BuildContext context, AsyncSnapshot snapshot) {
    _words = snapshot.data;
    return ListView.separated(
      itemBuilder: (context, index) {
        print(index);
        if (index >= _words.length - 1) {
          
          _setData();
          
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListTile(
          title: Text(_words[index]),
        );
      },
      itemCount: _words.length,
      separatorBuilder: (context, index) => Divider(),
    );
  }
}

