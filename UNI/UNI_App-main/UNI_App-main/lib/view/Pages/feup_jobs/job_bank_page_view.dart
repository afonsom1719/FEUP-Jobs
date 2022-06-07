import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/view/Pages/feup_jobs/job_listing_page_view.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';

import '../../../model/app_state.dart';
import '../general_page_view.dart';
import 'job.dart';
import 'job_filter_page_view.dart';

Future<List<Job>> _readJson() async {
  List<Job> _items = [];
  final String response = await rootBundle.loadString('assets/jobBank.json');
  final List<dynamic> data = await json.decode(response);

  for (dynamic it in data) {
    final Job application = Job.fromJson(it); // Parse data

    _items.add(application); // and organization to List
  }

  return _items;
}

class JobBankView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => JobBankState();
}

class JobBankState extends SecondaryPageViewState {
  Padding makeListTile(Job application) => Padding(
        padding: const EdgeInsets.all(10),
        child: InkWell(
          child: Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 5.0, top: 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(application.title,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    application.description,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => JobListingView(
                          application,
                        )));
          },
        ),
      );

  Card makeCard(Job lesson) => Card(
        elevation: 1.0,
        margin: const EdgeInsets.fromLTRB(2.0, 0.0, 2.0, 20.0),
        child: makeListTile(lesson),
      );

  Widget futureWidget() {
    return StoreConnector<AppState, List<String>>(converter: (store) {
      var jobFilters = store.state.content['jobFilters'];
      return jobFilters;
    }, builder: (context, jobFilters) {
      return FutureBuilder<List<Job>>(
          future: _readJson(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var filteredData = snapshot.data;
              if (jobFilters.isNotEmpty) {
                filteredData = snapshot.data
                    .where((element) => jobFilters.contains(element.departm));
              }

              return ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: filteredData?.length,
                itemBuilder: (BuildContext context, int index) {
                  return makeCard(filteredData.elementAt(index));
                },
              );
            } else if (snapshot.hasError) {
              return Text("$snapshot.error");
            }

            return Text("$snapshot.error");
          });
    });
  }

  Widget createMainView(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                "FEUP\'s Job Bank",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 24),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FilterScreenView(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 169, 47, 26),
                          fixedSize: const Size(100, 20)),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 12.0, right: 12),
                        child: Text('Filter'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 169, 47, 26),
                          fixedSize: const Size(100, 20)),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 12.0, right: 12),
                        child: Text('Search'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            futureWidget()
          ],
        ),
      ),
    );
  }

  @override
  Widget getBody(BuildContext context) {
    return createMainView(context);
  }
}
