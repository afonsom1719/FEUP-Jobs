import 'package:feup_jobs/applyForm.dart';
import 'package:feup_jobs/contactForm.dart';
import 'package:flutter/material.dart';
import 'Components/NavigationBar.dart';
import 'Components/BulletList.dart';
import 'jobs.dart';

class Listing extends StatelessWidget {
  final Job job;
  Listing({Key? key, required this.job}) : super(key: key);

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
        body: JobListingWidget(job: job),
      ),
    );
  }
}

class JobListingWidget extends StatefulWidget {
  final Job job;
  const JobListingWidget({Key? key, required this.job}) : super(key: key);

  @override
  State<JobListingWidget> createState() => _JobListingState();
}

class _JobListingState extends State<JobListingWidget> {
  final String _extra =
      "Your resume is a concise document that describes the work experience, professional skills and education that qualifies you for a job. Some industries and employers may look for more data that helps them understand your personality, ambitions or particular skills. An additional information section on your resume can include activities and pursuits outside of work that help a prospective employer know you better.";
  @override
  Widget build(BuildContext context) {
    return Padding(
        key: const Key("fullJobListing"),
        padding: const EdgeInsets.all(20),
        child: ListView(children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              widget.job.title,
              style: const TextStyle(
                  color: Colors.orangeAccent,
                  fontWeight: FontWeight.w500,
                  fontSize: 35),
            ),
          ),
          Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 5.0, top: 5.0),
              child: Text(
                widget.job.departm,
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
                widget.job.description,
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
            child: UnorderedList(widget.job.requirements),
          ),
          Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 5.0, top: 20.0),
              child: const Text(
                "Extra Information:",
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
                _extra,
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
                            builder: (context) => ApplyForm(
                                  jobPosition: widget.job.title,
                                )));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 169, 47, 26),
                  ),
                  child: const Text('Apply'))),
        ]));
  }
}
