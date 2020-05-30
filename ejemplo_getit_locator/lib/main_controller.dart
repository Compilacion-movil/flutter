
import 'package:ejemplogetitlocator/di/injector.dart';
import 'package:ejemplogetitlocator/main_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainController extends StatefulWidget {
  MainController({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainControllerState createState() => _MainControllerState();
}

class _MainControllerState extends State<MainController> {

  final viewModel = locator.get<MainViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text('El mensaje es:  ${viewModel.fetchData()}'),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
