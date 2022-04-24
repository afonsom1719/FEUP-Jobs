import 'package:flutter/material.dart';
import 'Components/NavigationBar.dart';

class Listing extends StatelessWidget {
  const Listing({Key? key}) : super(key: key);

  static const String _title = 'FEUP Jobs';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: headerBar(),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(children: <Widget>[
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'FEUPjobs',
                style: TextStyle(
                    color: Colors.orangeAccent,
                    fontWeight: FontWeight.w500,
                    fontSize: 50),
              )),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
          )
        ]));
  }
}
