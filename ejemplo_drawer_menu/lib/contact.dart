import 'package:ejemplo_drawer_menu/drawer_menu.dart';
import 'package:flutter/material.dart';

class Contact extends StatelessWidget {

  static const String routeName = '/contact';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact"),
      ),
      drawer: DrawerMenu(),
      body: Center(
        child: Text(
          'Contact Page',
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}