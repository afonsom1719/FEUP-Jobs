// ignore_for_file: unnecessary_new, unnecessary_const

import 'package:feup_jobs/Components/NavigationBar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ApplyPageState extends StatelessWidget {
  ApplyPageState({Key? key}) : super(key: key);

  static const String _title = 'FEUP Jobs';

  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        key: _scaffoldkey,
        appBar: const CustomAppBar(),
        drawer: const CustomDrawer(),
        body: const ApplyStateWidget(),
      ),
    );
  }
}

class ApplyStateWidget extends StatefulWidget {
  const ApplyStateWidget({Key? key}) : super(key: key);

  @override
  State<ApplyStateWidget> createState() => _ApplyStateWidget();
}

class _ApplyStateWidget extends State<ApplyStateWidget> {
  int selected = 1;
  Icon icon = const Icon(Icons.mail_outline);
  Text txt = const Text("Your apply form was sent!");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          icon = const Icon(Icons.mail_outline_outlined);
        } else if (index == 1) {
          icon = const Icon(Icons.access_time_outlined);
          txt = const Text(
              "The company you applied for received your application, please wait patiently for an answer");
        } else {
          icon = const Icon(Icons.beenhere_outlined);
          txt = const Text("The company already replied to your application!");
        }

        return Stack(
          children: <Widget>[
            Container(
                padding: const EdgeInsets.only(left: 40.0),
                color: Colors.white,
                child: new Card(
                  margin: const EdgeInsets.all(30.0),
                  child: new Container(
                    width: double.infinity,
                    height: 150.0,
                    child: txt,
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
                )),
            new Positioned(
              top: 0.0,
              bottom: 0.0,
              left: 35.0,
              child: new Container(
                height: double.infinity,
                width: 2.0,
                color: Colors.blue,
              ),
            ),
            new Positioned(
              top: 100.0,
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