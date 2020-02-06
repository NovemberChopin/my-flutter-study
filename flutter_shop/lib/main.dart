import 'package:flutter/material.dart';
import './pages/index_page.dart';
import 'package:provide/provide.dart';
import './provide/counter.dart';
import './provide/sub_category.dart';

void main() {
  var counter = Counter();
  var providers = Providers();
  var subCategoryProvider = SubCategoryProvider();
  providers
    ..provide(Provider<Counter>.value(counter))
    ..provide(Provider<SubCategoryProvider>.value(subCategoryProvider));
  runApp(ProviderNode(
    child: MyApp(),
    providers: providers,
  ));
} 

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: '百姓生活',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.pink
        ),
        home: IndexPage()
      )
    );
  }
}

