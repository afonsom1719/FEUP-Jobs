import 'package:flutter/material.dart';

PreferredSizeWidget headerBar(GlobalKey<ScaffoldState> _scaffoldkey) {
  Icon customIcon = const Icon(Icons.search);

  Widget customSearchBar = const Text('My Personal Journal');

  return AppBar(
    backgroundColor: const Color.fromARGB(255, 169, 47, 26),
    leading: GestureDetector(
      onTap: () {},
      child: IconButton(
          icon: const Icon(Icons.menu, size: 26.0),
          onPressed: () {
            _scaffoldkey.currentState?.openDrawer();
          }),
    ),
    actions: <Widget>[
      Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () {},
            child: IconButton(
              icon: const Icon(Icons.share, size: 26.0),
              onPressed: () {},
            ),
          )),
      Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () {},
            child: IconButton(
              icon: const Icon(Icons.search, size: 26.0),
              onPressed: () {},
            ),
          )),
    ],
  );
}

Widget createDrawer(double w, double h) {
  return Container(
      width: w / 2,
      child: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: h / 12,
              child: const DrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 169, 47, 26)),
                child: Text('Navigation'),
              ),
            ),
            ListTile(
              title: const Text('Home Page'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('FEUP Jobs'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Contacts'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ));
}
