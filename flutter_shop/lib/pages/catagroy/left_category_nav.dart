import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../service/service_method.dart';
import '../../model/category_model.dart';

class LeftCategoryNav extends StatefulWidget {
  LeftCategoryNav({Key key}) : super(key: key);

  @override
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {
  List<Category> list = [];

  Widget _leftInkWell(int index) {
    if(list.length != 0) {
      return InkWell(
        onTap: () {},
        child: Container(
          height: ScreenUtil().setHeight(100),
          padding: EdgeInsets.only(left:10, top: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(width: 1, color: Colors.black12)
            )
          ),
          child: Text(list[index].catelog, style: TextStyle(fontSize: ScreenUtil().setSp(28)),),
        ),
      );
    } else return Text(' ');
    
  }

  void _getCategory() async {
    getCategoryList().then((value) {
      CategoryModel categoryModel = CategoryModel.fromJson(value);
      List<Category> categoryList = categoryModel.categoryList;
      setState(() {
        list = categoryList;
      });
    });
  }
  
  @override
  void initState() { 
    super.initState();
    _getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       width: ScreenUtil().setWidth(180),
       decoration: BoxDecoration(
         border: Border(
           right: BorderSide(width: 1, color: Colors.black12)
         )
       ),
       child: ListView.builder(
         itemCount: list.length,
         itemBuilder: (context, index) {
           return _leftInkWell(index);
         },
       ),
    );
  }
}