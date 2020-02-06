import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provide/sub_category.dart';
import 'package:provide/provide.dart';

import '../../model/category_model.dart';

class RightCategoryNav extends StatefulWidget {
  _RightCategoryNavState createState() => _RightCategoryNavState();
}

class _RightCategoryNavState extends State<RightCategoryNav> {
  // List list = ['名酒', '宝丰', '北京二锅头', '老村长', '茅台', '女儿红', '杜康', '兰陵'];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Provide<SubCategoryProvider>(
        builder: (context, child, subCategoryProvider) {
          return Container(
            height: ScreenUtil().setHeight(80),
            width: ScreenUtil().setWidth(570),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(width: 1, color: Colors.black12))),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: subCategoryProvider.subCategoryList.length,
              itemBuilder: (context, index) {
                return _rightInkWell(subCategoryProvider.subCategoryList[index]);
              },
            )
          );
        },
      )
    );
  }

  Widget _rightInkWell(SubCategoryModel item) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
        child: Text(
          item.subCatelog,
          style: TextStyle(fontSize: ScreenUtil().setSp(28)),
        ),
      ),
    );
  }
}
