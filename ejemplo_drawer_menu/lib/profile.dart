import 'package:ejemplo_drawer_menu/drawer_menu.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {

  static const String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      drawer: DrawerMenu(),
      body: Center(
        child: Text(
          'Profile Page',
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}