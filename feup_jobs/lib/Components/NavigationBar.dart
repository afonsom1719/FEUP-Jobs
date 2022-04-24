import 'package:flutter/material.dart';

PreferredSizeWidget headerBar() {
  return AppBar(
    backgroundColor: const Color.fromARGB(255, 169, 47, 26),
    leading: GestureDetector(
      onTap: () {},
      child: IconButton(
        icon: const Icon(Icons.menu, size: 26.0),
        onPressed: () {},
      ),
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
