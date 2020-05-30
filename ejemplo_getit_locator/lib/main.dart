import 'package:ejemplogetitlocator/di/injector.dart';
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
      home: MyHomePage(title: 'GetIt Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
