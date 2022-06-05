import 'package:flutter/material.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';

import '../general_page_view.dart';
import 'job_filter_page_filter.dart';

class JobBankView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => JobBankState();
}

class JobBankState extends SecondaryPageViewState {
  final String _title = 'FEUP\'s Job Bank';
  final String _b1t = 'Sr. Cloud Security IS Engineer';
  final String _b1d =
      'Amgen is seeking a Cloud Security Engineer to join Amgen’s Cloud Security organization who will be reporting into the Global Information Protection Organization in Amgen and will be based in Lisbon, PRT, at Amgen’s new Capability Center.';
  final String _b2t = 'IT - Robotic Process Automation - Centro, Brazil';
  final String _b2d =
      'Work with Information Technology engaging in the brainstorming process to develop programmatic codes in Brazil. This job offer is a trainee program in a digital bank specialized on accountability consultancy.';
  final String _b3t = 'Developer (Digital Manufacturing Technology)';
  final String _b3d =
      'As part of our Manufacturing Technology Engineering Organization, our team of the SDC develops, implements and supports automation solutions for our tire plants worldwide.';

  @override
  Widget getBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                _title,
                style: const TextStyle(
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
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              key: Key('firstJobListing'),
              child: Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 5.0, top: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_b1t,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        _b1d,
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
                // Navigator.push( //context,
                //     MaterialPageRoute(builder: (context) => Listing()));
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: InkWell(
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 5.0, top: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_b2t,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          _b2d,
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
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => Listing()));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: InkWell(
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 5.0, top: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_b3t,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          _b3d,
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
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => Listing(),
                  //   ),
                  // );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
