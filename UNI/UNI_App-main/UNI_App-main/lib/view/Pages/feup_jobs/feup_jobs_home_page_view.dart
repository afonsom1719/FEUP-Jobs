import 'package:flutter/material.dart';
import 'package:uni/view/Pages/general_page_view.dart';
import 'package:uni/view/Pages/feup_jobs/job_bank_page_view.dart';
import 'package:uni/view/Pages/feup_jobs/jobs_at_feup_page_view.dart';

class FEUPJobsHomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FEUPJobsHomeState();
}

class FEUPJobsHomeState extends GeneralPageViewState {
  @override
  Widget getBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/feup-jobs-logo.png',
              height: 220,
            ),
          ),
          Container(
            height: 50,
            width: 200,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => JobBankView(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 169, 47, 26),
              ),
              key: Key('feupsjobbank'),
              child: const Text("FEUP's Job Bank"),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            height: 50,
            width: 200,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => JobsAtFEUPView(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 169, 47, 26),
              ),
              key: Key('jobsatfeup'),
              child: const Text('Jobs at FEUP'),
            ),
          ),
        ],
      ),
    );
  }
}
