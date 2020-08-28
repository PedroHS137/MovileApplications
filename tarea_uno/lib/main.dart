import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            },
            color: Colors.grey,
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
            //   print("$_counter");
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
