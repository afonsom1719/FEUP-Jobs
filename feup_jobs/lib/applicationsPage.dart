// ignore: file_names
import 'package:feup_jobs/Components/NavigationBar.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  ListPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: makeBody,
    );
  }
}

final makeBody = Container(
  child: ListView.builder(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: 5,
    itemBuilder: (BuildContext context, int index) {
      return makeCard;
    },
  ),
);

final makeCard = Card(
  elevation: 8.0,
  margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
  child: Container(
    decoration: const BoxDecoration(color: Color.fromARGB(200, 169, 47, 26)),
    child: makeListTile,
  ),
);

final makeListTile = ListTile(
    contentPadding:
        const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    leading: Container(
      padding: const EdgeInsets.only(right: 12.0),
      decoration: const BoxDecoration(
          border: Border(right: BorderSide(width: 1.0, color: Colors.white24))),
      child: const Icon(Icons.autorenew, color: Colors.white),
    ),
    title: const Text(
      "Introduction to Driving",
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

    subtitle: Row(
      // ignore: prefer_const_literals_to_create_immutables
      children: <Widget>[
        const Icon(Icons.linear_scale, color: Colors.yellowAccent),
        const Text(" Intermediate", style: TextStyle(color: Colors.white))
      ],
    ),
    trailing: const Icon(Icons.keyboard_arrow_right,
        color: Colors.white, size: 30.0));
