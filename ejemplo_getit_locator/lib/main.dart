import 'package:ejemplogetitlocator/di/injector.dart';
import 'package:ejemplogetitlocator/main_controller.dart';
import 'package:ejemplogetitlocator/main_viewmodel.dart';
import 'package:flutter/material.dart';

void main() {
  setupInjector();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejemplo de injector de dependencias - GetIt',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainController(title: 'GetIt Flutter'),
    );
  }
}
