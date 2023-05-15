import 'package:innovation_factory_test/src/core/util/injections.dart';
import 'package:innovation_factory_test/src/core/util/log/log_controller.dart';

initLogControllerInjection(){
  sl.registerLazySingleton<LogController>(() => LogController());
}