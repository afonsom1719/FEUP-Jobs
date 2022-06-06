// ignore_for_file: unnecessary_new, unnecessary_const, unnecessary_this

import 'package:flutter/material.dart';
import 'package:uni/view/Pages/general_page_view.dart';

// ignore: must_be_immutable
class ApplyPageView extends StatefulWidget {
  final String applicationName;
  final String company;
  double state;
  ApplyPageView(this.applicationName, this.company, this.state);

  @override
  State<StatefulWidget> createState() =>
      ApplyPageState(this.state, this.company, this.applicationName);
}

class ApplyPageState extends GeneralPageViewState {
  double selected;
  Icon icon = const Icon(Icons.mail_outline);
  String txt = "Your apply form was sent!";

  ApplyPageState(this.state, this.company, this.applicationName);

  final String applicationName;
  final String company;
  double state;

  @override
  Widget getBody(BuildContext context) {
    if (state >= 0.25 && state < 0.50) {
      selected = 0;
    } else if (state >= 0.50 && state < 0.75) {
      selected = 1;
    }
    if (state >= 0.75) {
      selected = 2;
    }
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          icon = const Icon(Icons.mail_outline_outlined);
        } else if (index == 1) {
          icon = const Icon(Icons.access_time_outlined);
          txt =
              "The company you applied for received your application, please wait patiently.";
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
