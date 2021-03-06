import 'package:flutter/material.dart';

void main() {
  runApp(FormApp());
}

class FormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Ejemplo de formulario en Flutter';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LoginScreen(),
        )),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  // Crea una clave global que identificará de manera única el widget Form
  // y nos permita validar el formulario
  //
  // Nota: Esto es un GlobalKey<FormState>, no un GlobalKey<LoginScreenState>!
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Crea un widget Form usando el _formKey que creamos anteriormente
    return Form( //1 Form como raiz de nuestro formulario
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _emailInput(),//2
          _passwordInput(),//2
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: _loginButton()),//2
        ],
      ),
    );
  }

  Widget _emailInput() {
    return TextFormField(
        decoration: const InputDecoration(
          icon: Icon(Icons.email),
          hintText: 'Inserte su email',
          labelText: 'Email',
        ),
        validator: (value) => _validatorEmail(value));
  }

  Widget _passwordInput() {
    return TextFormField(
        decoration: const InputDecoration(
          icon: Icon(Icons.lock),
          hintText: 'Inserte su contraseña',
          labelText: 'Contraseña',
        ),
        validator: (value) => _validatorPassword(value));
  }

  Widget _loginButton() {
    return ElevatedButton(
      onPressed: () {
        // devolverá true si el formulario es válido, o falso si
        // el formulario no es válido.
        if (_formKey.currentState.validate()) {
          // Si el formulario es válido, queremos mostrar un Snackbar
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text('Login correcto')));
        }
      },
      child: Text('Login'),
    );
  }

  String _validatorEmail(String value) {
    if (!_isEmail(value)) {
      return 'Please enter some text';
    }
  }

  String _validatorPassword(String value) {
    if (!_hasMinLenght(value)) {
      return 'Please enter some text';
    }
  }


  bool _isEmail(String str) {
    return _emailRegExp.hasMatch(str.toLowerCase());
  }

  static final RegExp _emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9\-\_]+(\.[a-zA-Z]+)*$");

  bool _hasMinLenght(String value){
    return value.isNotEmpty && value.length >= 8;
  }
}
