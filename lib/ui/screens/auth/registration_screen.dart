import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jus/core/routes/app_router.gr.dart';

import '../../../utils/extensions/build_context_extension.dart';
import '../../widgets/primary_form_field.dart';
import '../../../utils/constants/app_typography.dart';
import '../../widgets/buttons/primary_button.dart';

@RoutePage()
class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

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
                    'Register Your Free',
                    style: AppTypography.headlineLarge,
                  ),
                  Text(
                    'Account Now',
                    style: AppTypography.headlineLarge,
                  ),
                  const Gap(25),
                  PrimaryFormField(
                    lText: 'Username',
                    prefix: Icon(Icons.alternate_email),
                  ),
                  const Gap(10),
                  PrimaryFormField(
                      lText: 'Name', prefix: Icon(Icons.account_circle)),
                  const Gap(10),
                  PrimaryFormField(
                      lText: 'Phone Number', prefix: Icon(Icons.phone)),
                  const Gap(10),
                  PrimaryFormField(lText: 'E-mail', prefix: Icon(Icons.email)),
                  const Gap(10),
                  PrimaryFormField(
                    lText: 'Password',
                    prefix: Icon(Icons.lock),
                    isPassWord: true,
                  ),
                  const Gap(10),
                  PrimaryFormField(
                    lText: 'Confirm Password',
                    prefix: Icon(Icons.lock),
                    isPassWord: true,
                  ),
                  const Gap(50),
                  PrimaryButton(
                    text: 'Sign Up',
                    onTap: () {
                      context.router.push(
                        HomeTabRoute(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
