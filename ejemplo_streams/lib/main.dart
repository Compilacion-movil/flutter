import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());

  /**
   * Ejemplo de stream
   * con un único suscriptor
   */
  StreamController streamController = StreamController<String>();
  streamController.stream.listen((event) {
    print("Esto es el dato enviado:\n$event");
  }, onDone: () {
    print("Llamada al método onDone");
  }, onError: (error) {
    print("Llamada al método onError");
  });

  /** añadimos el dato al stream de datos */
  streamController.add("Esto es el dato que envío");
  /** cerramos el stream al finalizar */
  streamController.close();

  /**
   * Ejemplo de stream
   * con un múltiples suscriptores
   */
  StreamController streamControllerBroadcast =
      StreamController<String>.broadcast();

  streamControllerBroadcast.stream.listen((event) {
    print("listener 1:\n$event");
  });

  streamControllerBroadcast.stream.listen((event) {
    print("listener 2:\n$event");
  });

  streamControllerBroadcast.add("Dato para múltiples suscriptores");
  streamControllerBroadcast.close();

  Stream.fromFuture(fetchData()).listen((event) {
    print("dato desde Futuro:\n$event");
  });
}

Future<String> fetchData() {
  return Future.value("hola Futuro");
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  StreamController<int> _streamController = StreamController();

  int _counter = 0;

  void _incrementCounter() {
    _counter += 1;
    _streamController.add(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: StreamBuilder<int>(
          builder: (BuildContext context, snapShot) {
            if (!snapShot.hasError && snapShot.hasData) {
              return _buildBody(snapShot.data);
            } else {
              return Text("Error recibiendo datos");
            }
          },
          stream: _streamController.stream,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildBody(int value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('You have pushed the button this many times:'),
        Text(
          '$value',
          style: Theme.of(context).textTheme.headline4,
        ),
      ],
    );
  }

  @override
  void deactivate() {
    _streamController.close();
    super.deactivate();
  }
}
