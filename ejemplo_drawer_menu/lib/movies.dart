import 'package:ejemplo_drawer_menu/drawer_menu.dart';
import 'package:flutter/material.dart';

class Movies extends StatelessWidget {

  static const String routeName = '/movies';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
      ),
      drawer: DrawerMenu(),
      body: Center(
        child: Text(
          'Movies Page',
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}