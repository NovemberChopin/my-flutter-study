
import 'package:flutter/material.dart';

class Index {
  String iname;
  String ivalue;

  Index({this.iname, this.ivalue});

  factory Index.fromJson(Map<String, dynamic> json) {
    return Index(iname: json['iname'], ivalue: json['ivalue']);
  }
}

class WeatherBean {
  String city;
  String temp;
  List<Index> indexes;

  WeatherBean({this.city, this.temp, this.indexes});

  factory WeatherBean.fromJson(Map<String, dynamic> json) {
    var tempIndex = json['index'] as List;
    List<Index> indexList = tempIndex.map((i) => Index.fromJson(i)).toList();

    return WeatherBean(
        city: json['city'], temp: json['temp'], indexes: indexList);
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void _fun() {
    var jsonData = {
      "city": "大连",
      "temp": "17℃",
      "index": [
        {
          "iname": "空调指数",
          "ivalue": "较少开启",
        },
        {
          "iname": "运动指数",
          "ivalue": "较不宜",
        },
        {
          "iname": "紫外线指数",
          "ivalue": "最弱",
        },
      ],
    };

    WeatherBean _weatherBean = WeatherBean.fromJson(jsonData);
    List<Index> _index = _weatherBean.indexes;

    print('city:' + _weatherBean.city);
    print('temp:' + _weatherBean.temp);
    print('index:' + _index[0].iname);

    // Map<String, dynamic> json1 = json.decode(jsonData.toString());
    // print(json1.toString());
  }
  @override
  void initState() { 
    super.initState();
    _fun();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
       child: MaterialApp(
        title: '测试',
        home: Scaffold(
            appBar: AppBar(
              title: Text('测试JSON'),
            ),
            body: Center(
              child: Text('测试'),
            )),
      ),
    );
  }
}
