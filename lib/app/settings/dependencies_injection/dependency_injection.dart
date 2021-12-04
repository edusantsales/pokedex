import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class DependencyInjection {
  Future<void> configureDependencies() async {
    await _configureData();
    await _configureBusiness();
    await _configurePresentation();
  }

  // Future<void> _configureServices() async {
  //   getIt.registerFactory<Object>(() => Object());
  //   getIt.registerSingleton<Object>(Object());
  //   getIt.registerLazySingleton<Object>(() => Object());
  // }

  Future<void> _configureData() async {}
  Future<void> _configureBusiness() async {}
  Future<void> _configurePresentation() async {}
}
