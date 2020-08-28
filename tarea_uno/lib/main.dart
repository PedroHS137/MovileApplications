import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  bool _seen = false;
  DateTime now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Click the FAB'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: _seen? Colors.red : Colors.grey
            ),
            onPressed: () {
              _counter++;
              print("$_counter");
              setState(() {
                _seen = !_seen;
              });
              if(_counter%2==0){
                _scaffoldKey.currentState
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(content: Text("SnackBar Normal") ,));
              }else{
                 _scaffoldKey.currentState
                 ..hideCurrentSnackBar()
                 ..showSnackBar(SnackBar(content: Text("SnackBar date: $now"),action: SnackBarAction(label: "Exit", onPressed: (){SystemNavigator.pop();}),));
              }
              //_scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("SnackBar"),duration:Duration(seconds: 1) ,));
            },
            //color: Colors.grey,
            // child: Text(
            //   "click me",
            //   style: TextStyle(color: Colors.black),
            // ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("count: $_counter"),
            // MaterialButton(onPressed: () {
            //   _counter++;
            //print("$_counter");
            //   setState(() {

            //   });
            // },
            // color: Colors.blue,
            // child: Text("click me",
            // style: TextStyle(color: Colors.black),),)
          ],
        ),
      ),
    );
  }
}
