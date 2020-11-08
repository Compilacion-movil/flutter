import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _options = ["Sí, muchísimo", "No te creas", "Son un pestiño"];
  String _selectedOption = "Aún tengo que decidir";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ejemplo Cupertino ActionSheet"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_selectedOption),
            SizedBox(
              height: 30.00,
            ),
            RaisedButton(
                child: Text("Seleccione una opción"),
                onPressed: () => _showCupertinoActionSheet(context)),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _showCupertinoActionSheet(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (context) => _buildCupertinoActionSheet(context));
  }

  Widget _buildCupertinoActionSheet(BuildContext context) {
    return CupertinoActionSheet(
      title: Text("¿Te gustan las publicaciones de Compilación Movil?"),
      actions: [
        _buildActionSheet(context, _options[0]),
        _buildActionSheet(context, _options[1]),
        _buildActionSheet(context, _options[2])
      ],
      cancelButton: CupertinoActionSheetAction(
          isDestructiveAction: true,
          onPressed: () {
            _dismiss(context);
          },
          child: Text("Cancelar")),
    );
  }

  Widget _buildActionSheet(BuildContext context, String text){
    return CupertinoActionSheetAction(
        isDefaultAction: true,
        onPressed: () {
          _setSelectedOption(text, context);
        },
        child: Text(text));
  }

  void _setSelectedOption(String option, BuildContext context) {
    setState(() {
      _selectedOption = option;
      _dismiss(context);
    });
  }

  void _dismiss(BuildContext context) {
    Navigator.pop(context);
  }
}
