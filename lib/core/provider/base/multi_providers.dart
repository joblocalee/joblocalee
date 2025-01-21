import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../notification_provider.dart';
import '../category_provider.dart';
import '../auth_provider.dart';
import '../locality_provider.dart';
import '../../injection/injection.dart';
import '../vacancy_provider.dart';

abstract class MultiProviders {
  static final List<SingleChildWidget> providers = [
    ChangeNotifierProvider(
      create: (context) => locator<AuthProvider>(),
    ),
    ChangeNotifierProvider(
      create: (context) => locator<VacancyProvider>(),
    ),
    ChangeNotifierProvider(
      create: (context) => locator<LocalityProvider>(),
    ),
    ChangeNotifierProvider(
      create: (context) => locator<CategoryProvider>(),
    ),
    ChangeNotifierProvider(
      create: (context) => locator<NotificationProvider>(),
    ),
  ];
}