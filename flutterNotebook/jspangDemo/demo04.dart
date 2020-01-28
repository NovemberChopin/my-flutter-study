import 'package:flutter/material.dart';

void main()=> runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Flutter bottomNavigationBar',
      theme:ThemeData.light(),
      home:BottomNavigationWidget()
    );
  }
}

class BottomNavigationWidget extends StatefulWidget {
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _BottomNavigationColor = Colors.blue;

  int _currentIndex = 0;
  List<Widget> list = List();

  @override
  void initState(){
    list
      ..add(HomeScreen())
      ..add(EmailScreen())
      ..add(PagesScreen())
      ..add(AirplayScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       body: list[_currentIndex],
       bottomNavigationBar: BottomNavigationBar(
         items: [
           BottomNavigationBarItem(
             icon:Icon(
               Icons.home,
               color:_BottomNavigationColor,
             ),
             title:Text(
               'Home',
               style:TextStyle(color:_BottomNavigationColor)
             )
           ),
           BottomNavigationBarItem(
             icon:Icon(
               Icons.email,
               color:_BottomNavigationColor,
             ),
             title:Text(
               'Email',
               style:TextStyle(color:_BottomNavigationColor)
             )
           ),
           BottomNavigationBarItem(
             icon:Icon(
               Icons.pages,
               color:_BottomNavigationColor,
             ),
             title:Text(
               'Pages',
               style:TextStyle(color:_BottomNavigationColor)
             )
           ),
           BottomNavigationBarItem(
             icon:Icon(
               Icons.airplay,
               color:_BottomNavigationColor,
             ),
             title:Text(
               'AipPlay',
               style:TextStyle(color:_BottomNavigationColor)
             )
           ),
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


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('HOME'),
      ),
      body:Center(
        child: Text('HOME'),
      )
    );
  }
}
class EmailScreen extends StatelessWidget {
  const EmailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EMAIL'),
      ),
      body: Center(
        child: Text('EMAIL'),
      ),
    );
  }
}
class PagesScreen extends StatelessWidget {
  const PagesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PAGES'),
      ),
      body: Center(
        child: Text('PAGES'),
      ),
    );
  }
}
class AirplayScreen extends StatelessWidget {
  const AirplayScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Airplay'),
      ),
      body: Center(
        child: Text('Airplay'),
      ),
    );
  }
}