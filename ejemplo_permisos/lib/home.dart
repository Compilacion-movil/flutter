import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildButtonRequestPermissionCamera(Permission.camera, context),
            _buildButtonRequestPermissionContacts(Permission.contacts, context),
            _buildButtonRequestPermissionLocation(Permission.locationWhenInUse, context)
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildButtonRequestPermissionContacts(
      Permission permission, BuildContext context) {
    return _buildButton(
        Colors.yellow[300], 'Solicitud permiso contactos', permission, context);
  }

  Widget _buildButtonRequestPermissionLocation(
      Permission permission, BuildContext context) {
    return _buildButton(Colors.green[300], 'Solicitud permiso localización',
        permission, context);
  }

  Widget _buildButtonRequestPermissionCamera(
      Permission permission, BuildContext context) {
    return _buildButton(
        Colors.blue[300], 'Solicitud permiso camara', permission, context);
  }

  Widget _buildButton(
      Color color, String title, Permission permission, BuildContext context) {
    return MaterialButton(
      minWidth: 250,
      color: color,
      child: Text(title),
      onPressed: () {
        _requestPermission(permission, context);
      },
    );
  }

  void _requestPermission(Permission permission, BuildContext context) async {
    if (await permission.request().isGranted) {
      //Permiso concedido
      _displaySnackBar(context);
    }else if (await permission.request().isDenied){
      //Permiso revocado
      //debemso crear una alerta indicando al usaurio que necsitamos ese permiso
    } else {
      //Preguntamos si está permanentemente denegado, solo en Android
      requestPermanentlyDeniedPermission(permission);
    }
  }

  void _displaySnackBar(BuildContext context) {
    final snackBar = SnackBar(content: Text('Permiso concedido ya¡¡¡¡'));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  void requestPermanentlyDeniedPermission(Permission permission) async {
    if (await permission.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  void requestMultiplesPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.camera,
      Permission.contacts
    ].request();
    print(statuses[Permission.location]);
  }
}
