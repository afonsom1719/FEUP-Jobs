// ignore: file_names
// ignore_for_file: unnecessary_const

import 'package:feup_jobs/Apply_State_Page.dart';
import 'package:feup_jobs/Components/NavigationBar.dart';
import 'package:flutter/material.dart';

class Application {
  String title;
  String company;
  double indicatorValue;

  Application({
    required this.title,
    required this.company,
    required this.indicatorValue,
  });
}

class ListPage extends StatefulWidget {
  const ListPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late List applications = getApplications();

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(Application application) => ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: const EdgeInsets.only(right: 12.0),
            decoration: const BoxDecoration(
                border: const Border(
                    right:
                        const BorderSide(width: 1.0, color: Colors.white24))),
            child: const Icon(Icons.autorenew, color: Colors.white),
          ),
          title: Text(
            application.title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

          subtitle: Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                    // tag: 'hero',
                    child: LinearProgressIndicator(
                        backgroundColor:
                            const Color.fromRGBO(209, 224, 224, 0.2),
                        value: application.indicatorValue,
                        valueColor: const AlwaysStoppedAnimation(Colors.green)),
                  )),
              Expanded(
                flex: 4,
                child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(application.company,
                        style: const TextStyle(color: Colors.white))),
              )
            ],
          ),
          trailing: const Icon(Icons.keyboard_arrow_right,
              color: Colors.white, size: 30.0),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ApplyPageState(
                        applicationName: application.title,
                        company: application.company)));
          },
        );

    Card makeCard(Application lesson) => Card(
          elevation: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 110, 47, 50)),
            child: makeListTile(lesson),
          ),
        );

    final makeBody = Container(
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: applications.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(applications[index]);
        },
      ),
    );

    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: const Color.fromARGB(255, 169, 47, 26),
      title: Text(widget.title),
      actions: <Widget>[],
    );

    return Scaffold(
      appBar: topAppBar,
      body: makeBody,
    );
  }
}

List getApplications() {
  return [
    Application(
      title: "Junior Data Scientist",
      company: "Google",
      indicatorValue: 0.75,
    ),
    Application(
      title: "Senior Backend Developer",
      company: "Facebook",
      indicatorValue: 0.25,
    ),
    Application(
      title: "Frontend Developer Trainee",
      company: "Primavera",
      indicatorValue: 0.5,
    ),
    Application(
      title: "Fullstack Developer",
      company: "Amazon",
      indicatorValue: 0.75,
    ),
  ];
}
