// import '<FILE_NAME>.config.dart';
import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  getIt.init();
}
