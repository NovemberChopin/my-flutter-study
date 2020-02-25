import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("底部导航栏示例"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("实现1"),
              onPressed: () {
                Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => BottomNavigationWidget()));
              },
            ),
            RaisedButton(
              child: Text("实现2"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TabBarNav()));
              },
            )
          ],
        )
      ),
    );
  }
}

class TabBarNav extends StatefulWidget {
  TabBarNav({Key key}) : super(key: key);

  @override
  _TabBarNavState createState() => _TabBarNavState();
}

class _TabBarNavState extends State<TabBarNav> with SingleTickerProviderStateMixin {

  int _selectIndex = 1;
  TabController _tabController;
  List tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("导航栏"),
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e,)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(e, textScaleFactor: 5,),
          );
        }).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('Business')),
          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('School')),
        ],
        currentIndex: _selectIndex,
        fixedColor: Theme.of(context).accentColor,
        onTap: (int index) {
          setState(() {
            _selectIndex = index;
          });
        },
      ),
    );
  }
}



// 底部导航栏实现 1
class BottomNavigationWidget extends StatefulWidget {
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  
  int _currentIndex = 0;
  List<Widget> list = List();

  @override
  void initState(){
    list
      ..add(ScreenShow(text: "HOME",))
      ..add(ScreenShow(text: "EMAIL",))
      ..add(ScreenShow(text: "PAGES",))
      ..add(ScreenShow(text: "Airplay",));
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    Color bottomColor = Theme.of(context).accentColor;
     return Scaffold(
       body: list[_currentIndex],
       bottomNavigationBar: BottomNavigationBar(
         items: [
           BottomNavigationBarItem(
             icon:Icon(Icons.home, color: bottomColor,),
             title:Text('Home', style:TextStyle(color: bottomColor))
           ),
           BottomNavigationBarItem(icon:Icon(Icons.email), title:Text('Email')),
           BottomNavigationBarItem(icon:Icon(Icons.pages), title:Text('Pages')),
           BottomNavigationBarItem(icon:Icon(Icons.airplay),title:Text('AipPlay')),
         ],
         currentIndex:_currentIndex,
         onTap:(int index){
           setState((){
             _currentIndex= index;
           });
         },
         type:BottomNavigationBarType.fixed
       ),
     );
  }
}

class ScreenShow extends StatelessWidget {
  final String text;
  const ScreenShow({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(text),
      ),
      body: Center(
        child: Text(text),
      ),
    );
  }
}