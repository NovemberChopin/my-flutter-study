import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:url_launcher/url_launcher.dart';

// 店长电话模块
class LeaderPhone extends StatelessWidget {
  final String leaderImage; //店长图片
  final String leaderPhone; //店长电话

  LeaderPhone({Key key, this.leaderImage,this.leaderPhone}) : super(key: key);

  // 不知为何，不能打电话跳转
  // void _launchUrl() async {
  //   String url = 'tel:'+leaderPhone;
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw '不能访问Could not launch $url';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(200),
      width: ScreenUtil().setWidth(750),
      child: InkWell(
        onTap: () {},
        child: Image.network(leaderImage, fit: BoxFit.cover,),
      ),
    );
  }
}