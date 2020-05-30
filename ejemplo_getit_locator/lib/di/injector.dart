

import 'package:ejemplogetitlocator/main_repository.dart';
import 'package:ejemplogetitlocator/main_viewmodel.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupInjector() {
  locator.registerFactory<DataSource>( () => MainRepository());
  locator.registerSingleton(MainViewModel(repository: locator.get<DataSource>()));
}


