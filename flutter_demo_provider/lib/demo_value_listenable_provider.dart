import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ChangeNotifierProvide
class Counter {
  final ValueNotifier<int> valueNotifier = ValueNotifier(0);
}

class DemoValueListenableProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<Counter>(
      builder: (BuildContext context) => Counter(),
      child: Consumer<Counter>(builder: (context, counter, child) {
        return ValueListenableProvider<int>.value(
          value: counter.valueNotifier,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DemoConsumerWidget2(),
                OtherWidget(),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class DemoConsumerWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<int>(
      builder: (context, value, child) {
        return Text(
          value.toString(),
          style: TextStyle(fontSize: 20.0),
        );
      },
    );
  }
}

class OtherWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("Increment", style: TextStyle(fontSize: 20.0)),
      onPressed: () {
        final counter = Provider.of<Counter>(context);
        counter.valueNotifier.value++;
      },
    );
  }
}
