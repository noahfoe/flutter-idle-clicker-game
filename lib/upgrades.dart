//import 'main.dart';
import 'package:flutter/material.dart';

Widget _upgradeContainer() {
  return Material(
    color: Colors.blue,
    child: InkWell(
      onTap: () => print('container pressed'),
      child: Container(
        child: Text('Upgrade Box'),
        decoration:
            BoxDecoration(shape: BoxShape.rectangle, color: Colors.blue),
        margin: EdgeInsets.all(25),
        padding: EdgeInsets.fromLTRB(25, 50, 25, 50),
      ),
    ),
  );
}
