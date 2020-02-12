import 'package:flutter/material.dart';
import 'package:flutter_shop/model/details_model.dart';
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

  void _testDetailModel() {
    var jsondata = {
      "error": 0,
      "total_num": 1,
      "msg": "朋友圈文案综合接口",
      "data": [
        {
          "ID": 3417557,
          "GoodsId": "606881786356",
          "GoodsName": "【拍6件】网红日本海盐饼干600g",
          "GoodsClass": "美食",
          "TKMoneyRate": 30.00,
          "TjRemark":
              "【拍6件，600g】【蔡文静推荐】小红书网红爆款，休闲零食，选用优质小麦以及植物油，添加海水日晒海盐，自然烘焙，香甜酥脆，好吃停不下来。",
          "GoodsLink": "https://detail.tmall.com/item.htm?id=606881786356",
          "ActLink":
              "https://uland.taobao.com/quan/detail?sellerId=2206408066045&activityId=2cf8a192fd594cbb9344f75b55605e5c",
          "ImgUrl":
              "https://img.alicdn.com/bao/uploaded/O1CN01DPmh5O1uWemkxHemK_!!2-item_pic.png",
          "ActMoney": 10.00,
          "GoodsPrice": 24.88,
          "LastPrice": 14.88,
          "SaleCount": 562535,
          "TowHourCount": 3806,
          "AllDayCount": 3806,
          "RealImg":
              "https://img.alicdn.com/imgextra/i1/1828449528/O1CN01ukUnMe2KFsHq098Wp_!!1828449528.jpg",
          "RealImg2":
              "https://img.alicdn.com/imgextra/i2/1828449528/O1CN01kcjsKa2KFsHm8NfvO_!!1828449528.jpg",
          "RealImg3":
              "https://img.alicdn.com/imgextra/i1/1828449528/O1CN01EzotNF2KFsHo0BqVX_!!1828449528.jpg",
          "RealImg4":
              "https://img.alicdn.com/imgextra/i1/1828449528/O1CN01smAM6a2KFsHjDUrFN_!!1828449528.jpg",
          "RealImg5":
              "https://img.alicdn.com/imgextra/i3/1828449528/O1CN01mqW5kL2KFsI0gI8TI_!!1828449528.jpg",
          "RealImg6":
              "https://img.alicdn.com/imgextra/i1/1828449528/O1CN01ntF6Ez2KFsHqSZ5ND_!!1828449528.png",
          "PyqRemark":
              "<div>强烈推荐‼ 吃货必抢<img src=\"http://img.xuandan.com/emoji/10/bqfh44.png\" alt=\"📢\" title=\"\" data-alias=\"📢\"></div><div><img src=\"http://img.xuandan.com/emoji/8/bqfh11.png\" alt=\"👻\" title=\"\" data-alias=\"👻\">吃一次&nbsp; 就会惦记上</div><div>网红日本<img src=\"http://img.xuandan.com/emoji/4/bqfh91.png\" alt=\"✨\" title=\"\" data-alias=\"✨\">海盐饼干</div><div>很薄<img src=\"http://img.xuandan.com/emoji/1/bqfh7.png\" alt=\"😘\" title=\"\" data-alias=\"😘\">很脆吃起来上瘾~</div><div>拍6件，券后仅║￥14.88元<img src=\"http://img.xuandan.com/emoji/10/bqfh76.png\" alt=\"💰\" title=\"\" data-alias=\"💰\"></div><div>吃货们速度撸！<img src=\"http://img.xuandan.com/emoji/7/bqfh105.png\" alt=\"👍\" title=\"\" data-alias=\"👍\"></div>",
          "GoodsVideo": "",
          "CreateDateTime": "2020-02-12 08:29:01",
          "CopyRemark":
              "强烈推荐‼ 吃货必抢📢\n👻吃一次  就会惦记上\n网红日本✨海盐饼干\n很薄😘很脆吃起来上瘾~\n拍6件，券后仅║￥14.88元💰\n吃货们速度撸！👍\n",
          "ShopName": "豫吉食品旗舰店",
          "RemarkTime": null,
          "EndDate": "2020-02-14 23:59:59",
          "BeginDate": "2020-02-12 08:29:01",
          "cid": 8
        }
      ]
    };

    DetailPageData detailPageData = DetailPageData.fromJson(jsondata);
    DetailInfo detailInfo = detailPageData.info;
    print(detailInfo.toString());
  }

  List<CategoryModel> list = [];
  @override
  void initState() {
    super.initState();
    _testDetailModel();
    // _fun();
    // _testCategoryModel();
    // print('+++++++++');
    // setState(() {
    //   list = getCategroyList();
    //   print(list.length);
    // });
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
