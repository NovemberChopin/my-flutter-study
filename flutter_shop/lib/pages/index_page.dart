import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provide/currentIndex.dart';
import 'package:provide/provide.dart';

import './cart/index.dart';
import './catagroy/index.dart';
import './member_page.dart';
import './home/index.dart';

class IndexPage extends StatelessWidget {

  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text('首页')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      title: Text('分类')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.shopping_cart),
      title: Text('购物车')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      title: Text('会员中心')
    ),
  ];

  final List<Widget> tabBodies = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage()
  ];

  @override
  Widget build(BuildContext context) {
    //设置适配尺寸 (填入设计稿中设备的屏幕尺寸) 此处假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    
    return Provide<CurrentIndexProvider> (
      builder: (context, child, val) {
        int currentIndex = Provide.value<CurrentIndexProvider>(context).currentIndex;
        return Scaffold(
          backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            items: bottomTabs,
            onTap: (index) {
              Provide.value<CurrentIndexProvider>(context).changeIndex(index);
            },
          ),
          // body: currentPage,
          body: IndexedStack(
            index: currentIndex,
            children: tabBodies,
          ),
        );
      },
    );
  }
}