import 'package:flutter/material.dart';

import 'utils/constants/app_typography.dart';
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
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Color(0xFFFFFFFF),
        ),
        fontFamily: AppTypography.defaultFamily,
        useMaterial3: true,
      ),
    );
  }
}

