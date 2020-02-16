import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../provide/details_info.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailsWeb extends StatelessWidget {
  const DetailsWeb({Key key}) : super(key: key);

  List<Widget> _imageList(List<String> imageList) {
    return imageList.map((e) {
      return Image.network(e);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    
    return Provide<DetailsInfoProvider>(
      builder: (context, child, val) {
        var isLeft = Provide.value<DetailsInfoProvider>(context).isLeft;
        var goodsInfo = Provide.value<DetailsInfoProvider>(context).detailsInfo;
        
        List<String> realImages = [];
        if (isLeft) {
          if (goodsInfo != null) {

            // 默认文案， 如果朋友圈文案存在就用朋友圈文案
            String pyqRemark = goodsInfo.tjRemark;

            // 判断朋友圈文案是否为空
            if (goodsInfo.pyqRemark != null)
              pyqRemark = goodsInfo.pyqRemark;

            // 判断商品是否有详情图片，如果没有，就把首页图片作为详情图片
            if (goodsInfo.realImg.length > 0) {
              realImages = goodsInfo.realImg;
            } else {
              realImages.add(goodsInfo.imgUrl);
            }
            return Column(
              children: <Widget>[
                Column(
                  children: _imageList(realImages),
                ),
                Html(
                  data: pyqRemark,
                ),
                Container(
                  padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(80)),
                )
              ],
            );
          } else return CircularProgressIndicator();
        } else {
          return Container(
              width: ScreenUtil().setWidth(750),
              padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(80)),
              alignment: Alignment.center,
              child: Text('暂时无评论数据'));
        }
      },
    );
  }
}
