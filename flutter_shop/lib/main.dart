import 'package:flutter/material.dart';
import 'package:flutter_shop/routers/routes.dart';
import './pages/index_page.dart';
import 'package:provide/provide.dart';  // 引入状态管理模块
import './provide/counter.dart';
import './provide/sub_category.dart';
import './provide/details_info.dart';
import './provide/category_goods_list.dart';

import 'package:fluro/fluro.dart'; // 引入路由模块
import './routers/application.dart';

void main() {
  var counter = Counter();
  var providers = Providers();
  var subCategoryProvider = SubCategoryProvider();
  var categoryGoodsListProvide= CategoryGoodsListProvide();
  var detailsInforProvider = DetailsInfoProvider();
  providers
    ..provide(Provider<Counter>.value(counter))
    ..provide(Provider<SubCategoryProvider>.value(subCategoryProvider))
    ..provide(Provider<CategoryGoodsListProvide>.value(categoryGoodsListProvide))
    ..provide(Provider<DetailsInfoProvider>.value(detailsInforProvider));
  runApp(ProviderNode(
    child: MyApp(),
    providers: providers,
  ));
} 

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;

    return Container(
      child: MaterialApp(
        title: '选单网',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Application.router.generator,
        theme: ThemeData(
          primaryColor: Colors.pink
        ),
        home: IndexPage()
      )
    );
  }
}

