import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //下划线widget预定义以供复用。  
    Widget divider1=Divider(color: Colors.blue, height: 2.0,);
    Widget divider2=Divider(color: Colors.green, height: 2.0,);
    return Column(children: <Widget>[
      ListTile(title: Text("商品列表"),),
      Expanded(
        child: ListView.separated(
          itemCount: 100,
          // itemExtent: 50.0, // 每个元素的高度, ListView.builder 中存在
          separatorBuilder: (context, index) {
            return index % 2 == 0 ? divider1 : divider2;
          },
          itemBuilder: (context, index) => ListTile(title: Text("$index"),),
        ),
      )
    ],);
  }
}

class InfiniteListView extends StatefulWidget {
  InfiniteListView({Key key}) : super(key: key);

  @override
  _InfiniteListViewState createState() => _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = "##loading##";
  var _words = <String>[loadingTag];

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      _words.insertAll(_words.length - 1,
        // 每次生成二十个单词
        generateWordPairs().take(20).map((e) => e.asPascalCase).toList()
      );
      setState(() {
        // 重新构建列表
      });
    });
  }
  
  @override
  void initState() {
    _retrieveData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _words.length,
      itemBuilder: (context, index) {
        // 如果到了末尾
        if (_words[index] == loadingTag) {
          // 不足100条，继续获取数据
          if (_words.length - 1 < 100) {
            _retrieveData();
            // 加载时显示 loading
            return Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: SizedBox(
                width: 24.0,
                height: 24.0,
                child: CircularProgressIndicator(strokeWidth: 2,),
              ),
            );
          } else {
            // 已经加载了 100 条数据，不能再获取数据
            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(16.0),
              child: Text("没有更多了", style: TextStyle(color: Colors.grey),),
            );
          }
        }
        return ListTile(title: Text(_words[index]),);
      }, 
      separatorBuilder: (context, index) => Divider(height: 0.0,), 
    );
  }
}