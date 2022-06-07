import 'package:flutter/material.dart';
import 'package:uni/view/Pages/feup_jobs/job_contact_form_page_view.dart';
import 'package:uni/view/Pages/general_page_view.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';

import '../../Widgets/feup_jobs/bullet_list.dart';
import 'job.dart';

class JobListingView extends StatefulWidget {
  JobListingView(this.job);

  Job job;
  @override
  State<StatefulWidget> createState() => JobListingState(job);
}

class JobListingState extends SecondaryPageViewState {
  JobListingState(this.job);

  Job job;

  @override
  Widget getBody(BuildContext context) {
    return Padding(
        key: Key("fullJobListing"),
        padding: const EdgeInsets.all(20),
        child: ListView(children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              job.title,
              style: const TextStyle(
                  color: Colors.orangeAccent,
                  fontWeight: FontWeight.w500,
                  fontSize: 50),
            ),
          ),
          Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 5.0, top: 5.0),
              child: Text(
                job.departm,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 25),
                textAlign: TextAlign.left,
              )),
          Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 5.0, top: 20.0),
              child: const Text(
                "Details:",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
                textAlign: TextAlign.left,
              )),
          Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 5.0, top: 15.0),
              child: Text(
                job.description,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
                textAlign: TextAlign.left,
              )),
          Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 5.0, top: 20.0),
              child: const Text(
                "Requirements:",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
                textAlign: TextAlign.left,
              )),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 15.0, top: 10.0),
            child: UnorderedList(job.requirements),
          ),
          Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 5.0, top: 20.0),
              child: const Text(
                "Salary:",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
                textAlign: TextAlign.left,
              )),
          Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 5.0, top: 15.0, bottom: 30),
              child: Text(
                job.salary,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
                textAlign: TextAlign.left,
              )),
          Container(
              height: 50,
              color: Colors.orange,
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => JobContactFormView()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 169, 47, 26),
                  ),
                  child: const Text('Apply'))),
        ]));
  }
}
