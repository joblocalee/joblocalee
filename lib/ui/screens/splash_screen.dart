import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/routes/app_router.gr.dart';
import '../../utils/constants/app_images.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
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
      await context.router.push(const LoginRoute());
    }
  }
}
