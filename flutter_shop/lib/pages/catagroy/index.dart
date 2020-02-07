import 'package:flutter/material.dart';

import './left_category_nav.dart';
// import './right_category_nav.dart';
import './category_list.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('商品分类')),
      body: Container(
        child: Row(
          children: <Widget>[
            LeftCategoryNav(),
            CategoryGoodsList()
            // Column(
            //   children: <Widget>[
            //     RightCategoryNav(),
            //     CategoryGoodsList(),
            //   ],
            // )
          ],
        ),
      )
    );
  }
}