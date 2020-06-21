import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeController extends StatefulWidget {
  HomeController({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeControllerState createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Presiona el botón para mostrar el AlertDialog',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _buildAlertDialog(context),
        child: Icon(Icons.description),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _buildAlertDialog(BuildContext context) {
    if (Platform.isAndroid) {
      _materialAlertDialog(context);
    } else if (Platform.isIOS) {
      _cupertinoDialog(context);
    } else {
      _materialAlertDialog(context);
    }
  }

  Future<void> _materialAlertDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (_) => _showMaterialDialog(),
    );
  }

  Widget _showMaterialDialog() {
    return AlertDialog(
      title: _dialogTitle(),
      content: _contentText(),
      actions: _buildActions(),
    );
  }

  Future<void> _cupertinoDialog(BuildContext context) async {
    return showCupertinoDialog<void>(
      context: context,
      builder: (_) => _showCupertinoDialog(),
    );
  }

  Widget _showCupertinoDialog() {
    return CupertinoAlertDialog(
      title: _dialogTitle(),
      content: _contentText(),
      actions: _buildActions(),
    );
  }

  Widget _dialogTitle() {
    return Text('Notificaciones');
  }

  List<Widget> _buildActions() {
    return [
      _buildActionButton("Aceptar", Colors.blue),
      _buildActionButton("Cancelar", Colors.redAccent)
    ];
  }

  Widget _contentText() {
    return Text("¿Desea recibir notificaciones? Serán muy pocas de verdad :)");
  }

  Widget _contentScrollView() {
    return SingleChildScrollView(
      child: ListBody(
        children: <Widget>[
          Text('This is a demo alert dialog.'),
          Text('Would you like to approve of this message?'),
        ],
      ),
    );
  }

  Widget _buildActionButton(String title, Color color) {
    return FlatButton(
      child: Text(title),
      textColor: color,
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
