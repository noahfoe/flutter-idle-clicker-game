import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Incremental Game'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Score
            Text(
              'You have $_counter dollars',
              style: Theme.of(context).textTheme.headline4,
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 150, 0, 0)),

            // TODO: Make this its own widget, in a seperate file
            // Upgrades
            Material(
              color: Colors.blue,
              child: InkWell(
                onTap: () => print('container pressed'),
                child: Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Upgrade Box',
                      style: new TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  height: 150,
                  width: 150,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(100)),

            // Button
            CircleAvatar(
                radius: 35,
                backgroundColor: Colors.grey,
                child: IconButton(
                    onPressed: _incrementCounter,
                    splashRadius: 45,
                    splashColor: Colors.greenAccent,
                    color: Colors.blueGrey,
                    icon: Icon(
                      Icons.attach_money,
                      color: Colors.greenAccent,
                    ))),

            // Ad
          ],
        ),
      ),
    );
  }
}
