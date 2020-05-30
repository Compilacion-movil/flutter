
import 'package:ejemplogetitlocator/main_repository.dart';

class MainViewModel {
  MainViewModel({MainRepository repository}) : _repository = repository;

  MainRepository _repository;


  String fetchData() => _repository.fetchMessage();
}
