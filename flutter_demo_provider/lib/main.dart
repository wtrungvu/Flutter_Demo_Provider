import 'package:flutter/material.dart';
import 'package:flutter_demo_provider/basic.dart';
import 'package:flutter_demo_provider/demo_change_notifier.dart';
import 'package:flutter_demo_provider/demo_multiple_provider.dart';

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
        // body: DemoMultipleProvider(),
        // body: DemoMultipleProvider2(),
        body: DemoMultipleProvider2(),
      ),
    );
  }
}
