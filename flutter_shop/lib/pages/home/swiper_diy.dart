import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../tool/parseJson.dart';

// 顶上轮波图
class SwiperDiy extends StatelessWidget {
  const SwiperDiy({Key key, this.swiperDataList}) : super(key: key);
  final List<GoodsInfo> swiperDataList;

  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemBuilder: (BuildContext content, int index) {
          return Image.network(swiperDataList[index].imgUrl, fit: BoxFit.cover,);
        },
        itemCount: swiperDataList.length,
        pagination: new SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}