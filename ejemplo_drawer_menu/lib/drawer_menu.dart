import 'package:flutter/material.dart';

import 'main.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _buildDrawerHeader(),
          _buildDrawerItem(icon: Icons.home, text: 'Home', onTap: () => {
              Navigator.pushReplacementNamed(context, MyApp.home)
          }),
          _buildDrawerItem(icon: Icons.account_circle, text: 'Profile', onTap: () => {
            Navigator.pushReplacementNamed(context, MyApp.profile)
          }),
          _buildDrawerItem(icon: Icons.movie, text: 'Movies', onTap: () => {
            Navigator.pushReplacementNamed(context, MyApp.movies)
          }),
          Divider(),
          _buildDrawerItem(icon: Icons.contact_phone, text: 'Contact Info', onTap: () => {
            Navigator.pushReplacementNamed(context, MyApp.contacts)
          }),
          ListTile(
            title: Text('App version 1.0.0'),
            onTap: () {},
          ),
        ],
      ),
    );
  }


  Widget _buildDrawerHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image:  AssetImage('res/images/drawer_header.jpg'))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("Compilación Movil",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _buildDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
