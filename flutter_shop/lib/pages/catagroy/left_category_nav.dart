import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provide/sub_category.dart';
import 'package:provide/provide.dart';
import '../../model/category_model.dart';

class LeftCategoryNav extends StatefulWidget {
  LeftCategoryNav({Key key}) : super(key: key);

  @override
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {
  List<CategoryModel> list = [];
  var listIndex = 0;  // 大类索引

  Widget _leftInkWell(int index) {
    bool isClick = false;
    isClick = (index == listIndex) ? true:false;
    if(list.length != 0) {
      return InkWell(
        onTap: () {
          setState(() {
            listIndex = index;
          });
          // 修改二级分类的状态
          var subList = list[index].subCategoryList;
          Provide.value<SubCategoryProvider>(context).getSubCategoryList(subList);
        },
        child: Container(
          height: ScreenUtil().setHeight(100),
          padding: EdgeInsets.only(left:10, top: 20),
          decoration: BoxDecoration(
            // 当前类被点击，显示黑色
            color: isClick? Colors.pink[400] : Colors.white,
            // border: Border(
            //   bottom: BorderSide(width: 1, color: Colors.black12)
            // )
          ),
          child: Text(list[index].catelog, style: TextStyle(fontSize: ScreenUtil().setSp(28)),),
        ),
      );
    } else return Text(' ');
    
  }

  void _getCategory() async {
    // getCategoryList().then((value) {
    //   CategoryModel categoryModel = CategoryModel.fromJson(value);
    //   List<Category> categoryList = categoryModel.categoryList;
    //   setState(() {
    //     list = categoryList;
    //   });
    // });
    setState(() {
      list = getCategroyList();
    });
    // 修改子类状态
    // Provide.value<SubCategoryProvider>(context)
    //   .getSubCategoryList(list[0].subCategoryList);
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