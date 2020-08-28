import 'package:flutter/material.dart';

import 'counter_bloc.dart';
import 'counter_event.dart';

final _bloc = CounterBloc();

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder(
          stream: _bloc.counter,
          initialData: 0,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Score
                Text(
                  'You have ${snapshot.data} dollars',
                  style: Theme.of(context).textTheme.headline4,
                ),
                // Upgrade Boxes
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 75, 0, 75),
                  child: Wrap(
                    children: [
                      _UpgradeBox(
                        title: "Upgrade Box 1",
                        index: 1,
                        price: 10,
                        purchased: false,
                      ),
                      _UpgradeBox(
                        title: "Upgrade Box 2",
                        index: 2,
                        price: 20,
                        purchased: false,
                      ),
                      _UpgradeBox(
                        title: "Upgrade Box 3",
                        index: 3,
                        price: 50,
                        purchased: false,
                      ),
                      _UpgradeBox(
                        title: "Upgrade Box 4",
                        index: 4,
                        price: 30,
                        purchased: false,
                      )
                    ],
                  ),
                ),
                // Button
                CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.grey,
                    child: IconButton(
                        onPressed: () =>
                            _bloc.counterEventSink.add(IncrementEvent()),
                        splashRadius: 45,
                        splashColor: Colors.greenAccent,
                        color: Colors.blueGrey,
                        icon: Icon(
                          Icons.attach_money,
                          color: Colors.greenAccent,
                        ))),
                // Ad
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}

class _UpgradeBox extends StatefulWidget {
  _UpgradeBox({Key key, this.title, this.price, this.purchased, this.index})
      : super(key: key);

  final String title;
  final int index;
  final int price;
  bool purchased;

  @override
  _UpgradeBoxState createState() => _UpgradeBoxState();
}

class _UpgradeBoxState extends State<_UpgradeBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: Material(
        color: Colors.blue,
        child: InkWell(
          // TODO: Scale this onTap: if(index=1) -> Upgrade1Event, etc.
          onTap: () => _bloc.counterEventSink.add(Upgrade1Event()),
          child: Container(
            height: 150,
            width: 150,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                widget.title + "\n Price: \$" + widget.price.toString(),
                style: new TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
