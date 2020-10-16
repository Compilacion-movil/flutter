import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ejemplo de Snackbar"),
      ),
      body: Center(
        child: Builder(
          builder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    child: Text("Mostrar SnackBar sin evento"),
                    onPressed: () =>
                        openSnackBarWithoutAction(context: context)),
                RaisedButton(
                    child: Text("Mostrar SnackBar con evento"),
                    onPressed: () => openSnackBarWithAction(context: context)),
                RaisedButton(
                    child: Text("Custom SnackBar "),
                    onPressed: () =>
                        _customShapeSnackBar(context: context))
              ],
            );
          },
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void openSnackBarWithoutAction({@required BuildContext context}) {
    final snackBar = SnackBar(
      content: Text("Esto es una SnackBar sin evento asociado"),
      duration: Duration(seconds: 3),
    );

    _displaySnackBar(context: context, snackBar: snackBar);
  }

  void openSnackBarWithAction({@required BuildContext context}) {
    final snackBar = SnackBar(
      content: Text("Esto es una SnackBar con evento asociado"),
      duration: Duration(seconds: 3),
      action: SnackBarAction(
        label: "Deshacer",
        onPressed: () {
          print("Botón deshacer pulsado");
        },
      ),
    );

    _displaySnackBar(context: context, snackBar: snackBar);
  }

  void _displaySnackBar(
      {@required BuildContext context, @required SnackBar snackBar}) {
    Scaffold.of(context).showSnackBar(snackBar);
  }

  /// SnackBar customizados

  void _customBackgroundSnackBar({@required BuildContext context}) {
    final snackBar = SnackBar(
      content: Text("Esto es una SnackBar con custom background"),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.red,
    );

    _displaySnackBar(context: context, snackBar: snackBar);
  }

  void _customShapeSnackBar({@required BuildContext context}) {
    final snackBar = SnackBar(
      content: Text("Esto es una SnackBar con custom shape"),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5.00),
        ),
      ),
      behavior: SnackBarBehavior.floating,
    );

    _displaySnackBar(context: context, snackBar: snackBar);
  }
}
