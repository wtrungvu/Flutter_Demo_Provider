import 'package:flutter/material.dart';
import 'package:flutter_demo_provider/demo_change_notifier.dart';
import 'package:provider/provider.dart';

// ChangeNotifierProvide
class Counter1 with ChangeNotifier {
  int _count = 0;

  int get count => _count; // Getter

  increment() {
    _count++;
    notifyListeners();
  }

  decrement() {
    _count--;
    notifyListeners();
  }
}

class Counter2 with ChangeNotifier {
  int _count = 10;

  int get count => _count; // Getter

  increment() {
    _count++;
    notifyListeners();
  }

  decrement() {
    _count--;
    notifyListeners();
  }
}

class DemoMultipleProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => Counter1()),
        ChangeNotifierProvider(builder: (_) => Counter2()),
      ],
      child: TestWidget1(),
    );
  }
}

class TestWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Counter1 counter1 = Provider.of<Counter1>(context);
    Counter2 counter2 = Provider.of<Counter2>(context);

    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "count1 = ${counter1.count.toString()} \ncount2 = ${counter2.count.toString()}",
              style: TextStyle(fontSize: 50.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  color: Colors.green,
                  onPressed: () {
                    counter1.increment();
                    counter2.increment();
                  },
                  child: Text(
                    "Increment +",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                RaisedButton(
                  color: Colors.red,
                  onPressed: () {
                    counter1.decrement();
                    counter2.decrement();
                  },
                  child: Text(
                    "Decrement -",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
