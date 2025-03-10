import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/injection/injection.dart';
import '../../../utils/helper/custom_validators.dart';
import '../../../core/provider/auth_provider.dart';
import '../../../core/routes/app_router.gr.dart';
import '../../widgets/buttons/ink_well_material.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/primary_form_field.dart';
import '../../../utils/extensions/build_context_extension.dart';
import '../../../utils/constants/app_typography.dart';

@RoutePage()
class LoginScreen extends StatefulWidget implements AutoRouteWrapper {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

  @override
  Widget wrappedRoute(BuildContext context) => ChangeNotifierProvider.value(
    value: locator<AuthProvider>(),
    child: this,
  );
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailCtrl;
  late TextEditingController _passWordCtrl;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailCtrl = TextEditingController();
    _passWordCtrl = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.screenPadding),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(200.0),
                    Text(
                      'Login To',
                      style: AppTypography.headlineLarge.copyWith(
                        color: Colors.grey.shade900,
                        fontSize: 45.0,
                      ),
                    ),
                    Text(
                      'Job Localee',
                      style: AppTypography.headlineLarge.copyWith(
                        color: Colors.black,
                        fontSize: 50.0,
                      ),
                    ),
                    const Gap(30.0),
                    Container(
                      padding: EdgeInsets.all(20.0),
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
                            lText: 'E-mail',
                            prefix: Icon(Icons.mail),
                            controller: _emailCtrl,
                            maxLines: 1,
                            validator: (value) =>
                                CustomValidators.validateEmail(value),
                          ),
                          const Gap(10),
                          PrimaryFormField(
                            lText: 'Password',
                            prefix: Icon(Icons.lock),
                            isPassWord: true,
                            maxLines: 1,
                            controller: _passWordCtrl,
                            validator: (p0) =>
                                CustomValidators.validatePassword(p0),
                          ),
                          const Gap(50),
                          Consumer<AuthProvider>(
                            builder: (context, provider, _) {
                              return PrimaryButton(
                                btncolor: Colors.black,
                                txtcolor: Colors.white,
                                text: 'Login',
                                onTap: () => _login(),
                                isLoading: provider.isBusy,
                              );
                            },
                          ),
                          const Gap(50),
                          Text(
                            "Don't have an account yet?",
                            style: AppTypography.bodyLarge,
                          ),
                          InkWellMaterial(
                            onTap: () {
                              context.router.push(
                                RegistrationRoute(),
                              );
                            },
                            child: Text(
                              "Create Account?",
                              style: AppTypography.labelMedium.copyWith(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const Gap(30),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      )),
    );
  }

  @override
  void dispose() {
    _passWordCtrl.dispose();
    _emailCtrl.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      final result = await context.read<AuthProvider>().login(
            email: _emailCtrl.text,
            passWord: _passWordCtrl.text,
          );
      if (result && mounted) {
        await context.router.replaceAll([const HomeTabRoute()]);
      }
    }
  }
}
