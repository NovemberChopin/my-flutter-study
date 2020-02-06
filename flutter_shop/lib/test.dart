import 'package:flutter/material.dart';
import './model/category_model.dart';

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

  void _testCategoryModel() {
    var jsonData = {
      "resultcode": "200",
      "reason": "success",
      "result": [
        {"id": "242", "catalog": "中国文学"},
        {"id": "252", "catalog": "人物传记"},
        {"id": "244", "catalog": "儿童文学"},
        {"id": "248", "catalog": "历史"},
        {"id": "257", "catalog": "哲学"},
        {"id": "243", "catalog": "外国文学"},
        {"id": "247", "catalog": "小说"},
        {"id": "251", "catalog": "心灵鸡汤"},
        {"id": "253", "catalog": "心理学"},
        {"id": "250", "catalog": "成功励志"},
        {"id": "249", "catalog": "教育"},
        {"id": "245", "catalog": "散文"},
        {"id": "256", "catalog": "理财"},
        {"id": "254", "catalog": "管理"},
        {"id": "246", "catalog": "经典名著"},
        {"id": "255", "catalog": "经济"},
        {"id": "258", "catalog": "计算机"}
      ],
      "error_code": 0
    };

    CategoryList categoryList = CategoryList.fromJson(jsonData);
    List<CategoryModel> category = categoryList.categoryList;

    for (var i = 0; i < category.length; i++) {
      print('category: ' + category[i].catelog + '\n');
    }
  }

  List<CategoryModel> list = [];
  @override
  void initState() {
    super.initState();
    _fun();
    _testCategoryModel();
    print('+++++++++');
    setState(() {
      list = getCategroyList();
      print(list.length);
    });
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
