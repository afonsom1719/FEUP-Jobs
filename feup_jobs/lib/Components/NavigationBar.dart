// ignore_for_file: file_names

import 'package:flutter/material.dart';

PreferredSizeWidget headerBar() {
  return AppBar(
    backgroundColor: const Color.fromARGB(255, 169, 47, 26),
    leading: GestureDetector(
      onTap: () {/* Write listener code here */},
      child: const Icon(
        Icons.menu, // add custom icons also
      ),
    ),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: GestureDetector(
          onTap: () {},
          child: const Icon(Icons.share, size: 26.0),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: GestureDetector(
          onTap: () {},
          child: const Icon(Icons.search, size: 26.0),
        ),
      ),
    ],
  );
}
