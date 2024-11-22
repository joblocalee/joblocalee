import 'package:flutter/material.dart';

import 'core/injection/injection.dart';
import 'core/routes/app_router.dart';

Future<void> main() async {
  final WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();
  await _initialize(binding);

  runApp(const MyApp());
}

Future<void> _initialize(WidgetsBinding binding) async {
  await configureInjection();
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = locator<AppRouter>();
    return MaterialApp.router(
      routerConfig: appRouter.config(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

