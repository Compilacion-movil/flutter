
abstract class DataSource{
  String fetchMessage();
}

class MainRepository extends DataSource{

  MainRepository();

  @override
  String fetchMessage() => "Hola, esta prueba ha sido todo un éxito";
}