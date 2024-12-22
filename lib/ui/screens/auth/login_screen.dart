import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jus/core/provider/auth_provider.dart';
import 'package:jus/core/provider/base/multi_providers.dart';
import 'package:jus/core/routes/app_router.gr.dart';
import 'package:jus/ui/widgets/buttons/ink_well_material.dart';
import 'package:jus/utils/constants/app_images.dart';
import 'package:provider/provider.dart';

import '../../widgets/buttons/primary_button.dart';
import '../../widgets/primary_form_field.dart';
import '../../../utils/extensions/build_context_extension.dart';
import '../../../utils/constants/app_typography.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late TextEditingController _emailCtrl;
  late TextEditingController _passWordCtrl;

  @override
  void initState() {
    super.initState();
    _emailCtrl = TextEditingController();
    _passWordCtrl = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.screenPadding),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Gap(200),
                      Text(
                        'Login To',
                        style: AppTypography.headlineLarge.copyWith(
                          color: Colors.grey.shade900,
                          fontSize: 45,
                        ),
                      ),
                      Text(
                        'Job Localee',
                        style: AppTypography.headlineLarge.copyWith(
                          color: Colors.white,
                          fontSize: 50,
                        ),
                      ),
                      const Gap(30),
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
                              lText: 'E-mail',
                              prefix: Icon(Icons.mail),
                              controller: _emailCtrl,
                            ),
                            const Gap(10),
                            PrimaryFormField(
                              lText: 'Password',
                              prefix: Icon(Icons.lock),
                              isPassWord: true,
                              controller: _passWordCtrl,
                            ),
                            const Gap(50),
                            PrimaryButton(
                              text: 'Login',
                              onTap: () {
                                context.router.replaceAll([HomeTabRoute()]);
                              },
                            ),
                            const Gap(50),
                            Text(
                              "Don't have an account yet?",
                              style: AppTypography.bodyLarge,
                            ),
                            InkWellMaterial(
                              onTap: () {
                               context.router.push(RegistrationRoute(),);
                              },
                              child: Text(
                                "Create Account?",
                                style: AppTypography.labelMedium.copyWith(
                                  color: Colors.blueAccent,
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
    final result = await context.read<AuthProvider>().login(
      passWord: _passWordCtrl.text,
      email: _emailCtrl.text,
    );
    if (result && mounted) {
      await context.router.replaceAll([const HomeTabRoute()]);
    }
  }
}

