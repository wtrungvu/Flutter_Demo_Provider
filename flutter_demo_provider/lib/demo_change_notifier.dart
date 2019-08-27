import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ChangeNotifierProvide
class Counter with ChangeNotifier {
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

class DemoChangeNotifierProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Counter>(
      builder: (context) => Counter(),
      child: TestWidget(),
    );
  }
}

class TestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Counter counter = Provider.of<Counter>(context);

    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              counter.count.toString(),
              style: TextStyle(fontSize: 50.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  color: Colors.green,
                  onPressed: () => counter.increment(),
                  child: Text(
                    "Increment +",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                RaisedButton(
                  color: Colors.red,
                  onPressed: () => counter.decrement(),
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
