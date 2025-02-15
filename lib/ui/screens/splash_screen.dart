import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/injection/injection.dart';
import '../../core/provider/auth_provider.dart';
import '../../utils/constants/app_images.dart';

@RoutePage()
class SplashScreen extends StatelessWidget implements AutoRouteWrapper {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _next(context);
    return Scaffold(
      body: Center(
        child: Image.asset(
          AppImages.splashImage,
          height: 500,
        ),
      ),
    );
  }

  Future<void> _next(BuildContext context) async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    if (context.mounted) {
      context.read<AuthProvider>().start();
    }
  }

  @override
  Widget wrappedRoute(BuildContext context) => ChangeNotifierProvider.value(
    value: locator<AuthProvider>(),
    child: this,
  );
}
