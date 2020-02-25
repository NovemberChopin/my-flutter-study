import 'package:flutter/material.dart';

// Row和Column都继承自Flex，参数基本相同
// Flex 多了 Direction 属性

class FlexWedgit extends StatelessWidget {
  const FlexWedgit({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("弹性布局"),),
      body: Column(
        children: <Widget>[
          //Flex的两个子widget按1：2来占据水平空间  
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(height: 30, color: Colors.red,),
              ),
              Expanded(
                flex: 2,
                child: Container(height: 30, color: Colors.green,),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.0),
            child: SizedBox(
              height: 200.0,
              //Flex的三个子widget，在垂直方向按2：1：1来占用200像素的空间  
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(color: Colors.red,),
                  ),
                  Spacer(flex: 1,),
                  Expanded(
                    flex: 1,
                    child: Container(color: Colors.red,),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}