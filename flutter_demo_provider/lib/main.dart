import 'package:flutter/material.dart';
import 'package:flutter_demo_provider/basic.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo Provider",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Demo Provider"),
        ),
        body: BasicProvider(),
      ),
    );
  }
}
