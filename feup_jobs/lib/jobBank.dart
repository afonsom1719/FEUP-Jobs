import 'package:feup_jobs/listing.dart';
import 'package:flutter/material.dart';
import 'Components/NavigationBar.dart';
import 'package:feup_jobs/filterScreen.dart';

import 'dart:convert';

import 'package:feup_jobs/jobs.dart';
import 'package:flutter/services.dart';

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

class Bank extends StatefulWidget {
  const Bank({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<Bank> {
  Padding makeListTile(Job application) => Padding(
        padding: const EdgeInsets.all(10),
        child: InkWell(
          child: Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 5.0, top: 15.0),
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
                    builder: (context) => Listing(
                          job: application,
                        )));
          },
        ),
      );

  Card makeCard(Job lesson) => Card(
        elevation: 8.0,
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          child: makeListTile(lesson),
        ),
      );

  Widget futureWidget() {
    return FutureBuilder<List<Job>>(
        future: _readJson(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return makeCard(snapshot.data!.elementAt(index));
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Text("$snapshot.error");
          }

          return Text("$snapshot.error");
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
              padding: const EdgeInsets.only(top: 25.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Filter(),
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
                  ElevatedButton(
                    onPressed: () {
                      /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Sort())); */
                    },
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 169, 47, 26),
                        fixedSize: const Size(100, 20)),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 12.0, right: 12),
                      child: Text('Sort'),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HoverSearch())); */
                    },
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 169, 47, 26),
                        fixedSize: const Size(100, 20)),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 12.0, right: 12),
                      child: Text('Search'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              key: const Key('firstJobListing'),
              child: Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 5.0, top: 15.0),
                  child: Container(child: futureWidget())),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: const Color.fromARGB(255, 169, 47, 26),
      title: Text(widget.title),
      actions: const <Widget>[],
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Feup's Jobs",
      home: Scaffold(
        appBar: const CustomAppBar(
          searchIcon: true,
        ),
        drawer: const CustomDrawer(),
        body: createMainView(context),
      ),
    );
  }
}
