// ignore_for_file: unnecessary_new, unnecessary_const, unnecessary_this

import 'package:feup_jobs/Components/NavigationBar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ApplyPageState extends StatelessWidget {
  final String applicationName;
  final String company;
  late double state;
  ApplyPageState(
      {Key? key,
      required this.applicationName,
      required this.company,
      required this.state})
      : super(key: key);

  static const String _title = 'FEUP Jobs';

  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        key: _scaffoldkey,
        appBar: topAppBar(this.applicationName, this.company),
        drawer: const CustomDrawer(),
        body: ApplyStateWidget(
          state: this.state,
        ),
      ),
    );
  }
}

class ApplyStateWidget extends StatefulWidget {
  final double state;
  const ApplyStateWidget({Key? key, required this.state}) : super(key: key);

  @override
  State<ApplyStateWidget> createState() => _ApplyStateWidget();
}

class _ApplyStateWidget extends State<ApplyStateWidget> {
  late double selected;
  Icon icon = const Icon(Icons.mail_outline);
  String txt = "Your apply form was sent!";

  @override
  Widget build(BuildContext context) {
    if (widget.state >= 0.25 && widget.state < 0.50) {
      selected = 0;
    } else if (widget.state >= 0.50 && widget.state < 0.75) {
      selected = 1;
    }
    if (widget.state >= 0.75) {
      selected = 2;
    }
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          icon = const Icon(Icons.mail_outline_outlined);
        } else if (index == 1) {
          icon = const Icon(Icons.access_time_outlined);
          txt =
              "The company you applied for received your application, please wait patiently for an answer.";
        } else {
          icon = const Icon(Icons.beenhere_outlined);
          txt = "The company already replied to your application!";
        }

        return Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 40.0, top: 30.0),
              color: Colors.white,
              child: new Card(
                margin: const EdgeInsets.all(30.0),
                child: new Container(
                  width: double.infinity,
                  height: 150.0,
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: Text(txt, style: const TextStyle(fontSize: 22))),
                  ),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 169, 47, 26),
                    gradient: const LinearGradient(
                        colors: const [
                          Color.fromARGB(255, 169, 47, 26),
                          Colors.white,
                        ],
                        begin: Alignment.centerRight,
                        end: const Alignment(-1.0, -1.0)),
                  ),
                ),
              ),
            ),
            new Positioned(
              top: (index == 0) ? 30.0 : 0.0,
              bottom: -10,
              left: 35.0,
              child: new Container(
                height: double.infinity,
                width: 3.0,
                color: Colors.blue,
              ),
            ),
            new Positioned(
              top: 110.0,
              left: 15.0,
              child: new Container(
                height: 40.0,
                width: 40.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                child: Container(
                  child: icon,
                  margin: const EdgeInsets.all(4.0),
                  height: 15.0,
                  width: 30.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (index <= selected) ? Colors.green : Colors.red),
                ),
              ),
            ),
          ],
        );
      },
      itemCount: 3,
    );
  }
}

AppBar topAppBar(String applicationName, String company) {
  return AppBar(
    elevation: 0.1,
    backgroundColor: const Color.fromARGB(255, 169, 47, 26),
    title: Text(applicationName + "  -  " + company),
    actions: const <Widget>[],
  );
}
