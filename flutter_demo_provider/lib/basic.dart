import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Exposing a value
class User {
  // No extends or with ChangeNotifer
  String _name;

  String get name => _name; // Getter
  set name(newName) => _name = newName; // Setter
}

class BasicProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = User();
    user.name = "Trung Vu";

    return Provider<User>.value(
      value: user,
      child: BasicWidget(),
    );
  }
}

class BasicWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          DemoConsumerWidget(),
          DemoWithoutConsumerWidget(),
        ],
      ),
    );
  }
}

class DemoConsumerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<User>(
      builder: (context, user, child) => Text(user.name),
    );
  }
}

class DemoWithoutConsumerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    return Container(
      child: Text(user.name),
    );
  }
}
