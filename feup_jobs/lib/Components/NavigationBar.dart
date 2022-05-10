import 'package:flutter/material.dart';

import '../home.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, GlobalKey<ScaffoldState>? scaffoldkey})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 169, 47, 26),
      leading: IconButton(
          icon: const Icon(Icons.menu, size: 26.0),
          onPressed: () {
            setState(() {
              Scaffold.of(context).openDrawer();
            });
          }),
      actions: <Widget>[
        Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: IconButton(
                icon: const Icon(Icons.search, size: 26.0),
                onPressed: () {
                  showSearch(context: context, delegate: MySearchDelegate());
                },
              ),
            )),
      ],
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
        hintColor: Colors.white,
        primaryColor: Color.fromARGB(255, 169, 47, 26),
        primaryIconTheme: theme.primaryIconTheme,
        primaryTextTheme: theme.primaryTextTheme,
        textTheme: theme.textTheme,
        appBarTheme: theme.appBarTheme
            .copyWith(color: Color.fromARGB(255, 169, 47, 26)));
  }

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              query = '';
            },
            icon: Icon(Icons.cancel))
      ];

  @override
  Widget? buildLeading(BuildContext context) => Container(
      child: IconButton(
          onPressed: () {
            close(context, null);
          },
          icon: const Icon(Icons.arrow_back)));

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = [
      'Engenharia Informática',
      'Engenharia Civil',
      'Engenharia Mecânica'
    ];

    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];
          return ListTile(
            title: Text(suggestion),
            onTap: () {
              query = suggestion;
              showResults(context);
            },
          );
        });
  }
}

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
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
              Container(
                alignment: Alignment.center,
                height: kToolbarHeight,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 180, 180, 180),
                ),
                child: const ListTile(
                  title: Text('Navigation'),
                ),
              ),
              ListTile(
                title: const Text('Home Page'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
              ),
              ListTile(
                title: const Text('FEUP Jobs'),
                onTap: () {},
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
}
