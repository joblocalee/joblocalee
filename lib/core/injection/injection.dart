import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../routes/app_router.dart';
import 'injection.config.dart';

final GetIt locator = GetIt.instance;

@InjectableInit(generateForDir: ['lib'])
Future<void> configureInjection() async {
  await locator.init();
}

@module
abstract class RegisterModule {

  @lazySingleton
  AppRouter get instance => AppRouter();

}