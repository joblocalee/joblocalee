import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jus/core/provider/auth_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/injection/injection.dart';
import '../../../core/routes/app_router.gr.dart';
import '../../../utils/extensions/build_context_extension.dart';
import '../../widgets/primary_form_field.dart';
import '../../../utils/constants/app_typography.dart';
import '../../widgets/buttons/primary_button.dart';

@RoutePage()
class RegistrationScreen extends StatefulWidget implements AutoRouteWrapper {
  const RegistrationScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) => ChangeNotifierProvider.value(
        value: locator<AuthProvider>(),
        child: this,
      );

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            context.router.pushNamed('/login');
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.screenPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Register Your Free\nAccount Now',
                    style: AppTypography.headlineLarge,
                  ),
                  const Gap(25),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 5),
                        ),
                      ],
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Welcome to Job Localee!',
                          style: AppTypography.bodyLarge,
                        ),
                        const Gap(10),
                        PrimaryFormField(
                          controller: _nameController,
                          lText: 'Name',
                          prefix: Icon(Icons.alternate_email),
                        ),
                        const Gap(10),
                        PrimaryFormField(
                            controller: _phoneController,
                            lText: 'Phone Number',
                            prefix: Icon(Icons.phone)),
                        const Gap(10),
                        PrimaryFormField(
                            controller: _emailController,
                            lText: 'E-mail',
                            prefix: Icon(Icons.email)),
                        const Gap(10),
                        PrimaryFormField(
                          controller: _passwordController,
                          lText: 'Password',
                          prefix: Icon(Icons.lock),
                          isPassWord: true,
                        ),
                        const Gap(10),
                        PrimaryFormField(
                          controller: _confirmPasswordController,
                          lText: 'Confirm Password',
                          prefix: Icon(Icons.lock),
                          isPassWord: true,
                        ),
                        const Gap(50),
                        Consumer<AuthProvider>(
                          builder: (context, provider, _) {
                            return PrimaryButton(
                              text: 'Sign Up',
                              onTap: _register,
                            );
                          }
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _register() async {
    await context.read<AuthProvider>().registration(
          email: _emailController.text,
          name: _nameController.text,
          passWord: _passwordController.text,
          phoneNumber: _phoneController.text,
        );
    if (mounted) {
      context.router.replaceAll(const [HomeTabRoute()]);
    }
  }
}
