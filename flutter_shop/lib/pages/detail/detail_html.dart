import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../provide/details_info.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailsWeb extends StatelessWidget {
  const DetailsWeb({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // String remark = "此商品暂无数据";
    // var goodsDetail = Provide.value<DetailsInfoProvider>(context).detailsInfo;
    // if (goodsDetail.tjRemark != '') {
    //   remark = goodsDetail.tjRemark;
    // }
    return Provide<DetailsInfoProvider>(
      builder: (context, child, val) {
        var isLeft = Provide.value<DetailsInfoProvider>(context).isLeft;
        var goodsInfo = Provide.value<DetailsInfoProvider>(context).detailsInfo;
        if (isLeft) {
          if (goodsInfo != null) {
            return Container(
              padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(80)),
              child: Html(data: goodsInfo.tjRemark),
            );
          } else return Text('正在加载中');
          
        } else {
          return Container(
              width: ScreenUtil().setWidth(750),
              padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(80)),
              alignment: Alignment.center,
              child: Text('暂时没有数据'));
        }
      },
    );
  }
}
