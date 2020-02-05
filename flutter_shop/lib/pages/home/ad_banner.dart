import 'package:flutter/material.dart';

// 广告图片
class AdBanner extends StatelessWidget {
  const AdBanner({Key key, this.advertesPic}) : super(key: key);
  final String advertesPic;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(advertesPic),
    );
  }
}