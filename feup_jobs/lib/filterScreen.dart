import 'package:flutter/material.dart';
import 'Components/NavigationBar.dart';


class Filter extends StatelessWidget {
  const Filter({Key? key}) : super(key: key);

  static const String _title = 'Filter';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        appBar: CustomAppBar(),
        body: const FilterScreenWidget(),
      ),
    );
  }

}

class FilterScreenWidget extends StatefulWidget {
  const FilterScreenWidget({Key? key}) : super(key: key);

  @override
  State<FilterScreenWidget> createState() => _JobBankState();
}

class _JobBankState extends State<FilterScreenWidget> {

  final String _title = 'Select the options for your filters';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(children: <Widget>[

            /*Container(
              alignment: Alignment.topLeft,
              child: Text(
                _title,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 24),
              ),
            ),*/
            SizedBox(
              height: 50,
              width:50,
            ),
            Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top: 25.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Filter()));
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 169, 47, 26),
                            fixedSize: Size(150, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0, right:12),
                          child: const Text('Portugal'),
                        )),
                    SizedBox(
                      width: 50,
                      height: 50,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Sort())); */
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 169, 47, 26),
                            fixedSize: Size(150, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0, right:12),
                          child: const Text('International'),
                        )),
                    SizedBox(
                      width: 50,
                      height: 50,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HoverSearch())); */
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 169, 47, 26),
                            fixedSize: Size(150, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          ),

                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0, right:12),
                          child: const Text('Internship'),
                        )),
                    SizedBox(
                      width: 50,
                      height: 50,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HoverSearch())); */
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 169, 47, 26),
                          fixedSize: Size(150, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          ),

                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0, right:12),
                          child: const Text('Part-time'),
                        )),
                    SizedBox(
                      width: 50,
                      height: 50,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HoverSearch())); */
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 169, 47, 26),
                          fixedSize: Size(150, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          ),

                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0, right:12),
                          child: const Text('Full-time'),
                        )),
                    SizedBox(
                      width: 50,
                      height: 50,
                    ),
                  ],
                )),
            SizedBox(
              width: 50,
              height: 50,
            ),
            Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top: 25.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Filter()));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 169, 47, 26),
                          fixedSize: Size(150, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0, right:12),
                          child: const Text('Portugal'),
                        )),
                    SizedBox(
                      width: 50,
                      height: 50,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Sort())); */
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 169, 47, 26),
                          fixedSize: Size(150, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0, right:12),
                          child: const Text('International'),
                        )),
                    SizedBox(
                      width: 50,
                      height: 50,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HoverSearch())); */
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 169, 47, 26),
                          fixedSize: Size(150, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          ),

                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0, right:12),
                          child: const Text('Contract'),
                        )),
                    SizedBox(
                      width: 50,
                      height: 50,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HoverSearch())); */
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 169, 47, 26),
                          fixedSize: Size(150, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          ),

                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0, right:12),
                          child: const Text('Short term'),
                        )),
                    SizedBox(
                      width: 50,
                      height: 50,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HoverSearch())); */
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 169, 47, 26),
                          fixedSize: Size(150, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          ),

                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0, right:12),
                          child: const Text('Long term'),
                        )),
                    SizedBox(
                      width: 50,
                      height: 50,
                    ),
                  ],
                )),
          ])),
    );
  }
}








