import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/provider/auth_provider.dart';
import '../../../core/injection/injection.dart';
import '../../../utils/extensions/build_context_extension.dart';
import '../../../utils/helper/custom_validators.dart';
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

class _RegistrationScreenState extends State<RegistrationScreen>
    with SingleTickerProviderStateMixin {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _genderController = TextEditingController();
  final _ageController = TextEditingController();
  final _addressController = TextEditingController();

  // final _localityController = TextEditingController();
  final _educationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
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
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.screenPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Register Your Free\nAccount Now',
                          style: AppTypography.headlineLarge,
                        ),
                      ),
                      const Gap(25),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(
                                alpha: 0.2,
                              ),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 5),
                            ),
                          ],
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: SizedBox(
                          height: 600,
                          width: double.infinity,
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              Form(
                                key: _formKey,
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    children: [
                                      const Text(
                                        'Welcome to Job Localee!',
                                        style: AppTypography.bodyLarge,
                                      ),
                                      const Gap(10),
                                      PrimaryFormField(
                                        controller: _nameController,
                                        lText: 'Name',
                                        prefix:
                                            const Icon(Icons.person_outlined),
                                        maxLines: 1,
                                        validator: (value) =>
                                            CustomValidators.validateRequired(
                                                value),
                                      ),
                                      const Gap(10),
                                      PrimaryFormField(
                                        controller: _phoneController,
                                        lText: 'Phone Number',
                                        prefix: const Icon(Icons.phone),
                                        maxLines: 1,
                                        validator: (value) =>
                                            CustomValidators.validateRequired(
                                                value),
                                      ),
                                      const Gap(10),
                                      PrimaryFormField(
                                        controller: _emailController,
                                        lText: 'E-mail',
                                        prefix: const Icon(Icons.email),
                                        maxLines: 1,
                                        validator: (value) =>
                                            CustomValidators.validateEmail(
                                                value),
                                      ),
                                      const Gap(10),
                                      PrimaryFormField(
                                        controller: _passwordController,
                                        lText: 'Password',
                                        prefix: const Icon(Icons.lock),
                                        isPassWord: true,
                                        maxLines: 1,
                                        validator: (p0) =>
                                            CustomValidators.validatePassword(
                                                p0),
                                      ),
                                      const Gap(10),
                                      PrimaryFormField(
                                        controller: _confirmPasswordController,
                                        lText: 'Confirm Password',
                                        prefix: const Icon(Icons.lock),
                                        isPassWord: true,
                                        maxLines: 1,
                                        validator: (p0) =>
                                            CustomValidators.validatePassword(
                                                p0),
                                      ),
                                      const Gap(50),
                                      Consumer<AuthProvider>(
                                        builder: (context, provider, _) {
                                          return PrimaryButton(
                                            btncolor: Colors.black,
                                            txtcolor: Colors.white,
                                            text: 'Sign Up',
                                            onTap: () => _register(),
                                            isLoading: provider.isBusy,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Form(
                                key: _formKey1,
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    children: [
                                      const Text(
                                        'Personal Details',
                                        style: AppTypography.bodyLarge,
                                      ),
                                      const Gap(10),
                                      PrimaryFormField(
                                        controller: _genderController,
                                        lText: 'Gender',
                                        prefix:
                                            const Icon(Icons.person_outlined),
                                        maxLines: 1,
                                        validator: (value) =>
                                            CustomValidators.validateRequired(
                                                value),
                                      ),
                                      const Gap(10),
                                      PrimaryFormField(
                                        controller: _ageController,
                                        lText: 'Age',
                                        prefix: const Icon(Icons.numbers),
                                        maxLines: 1,
                                        validator: (value) =>
                                            CustomValidators.validateRequired(
                                                value),
                                      ),
                                      const Gap(10),
                                      PrimaryFormField(
                                        controller: _addressController,
                                        lText: 'Address',
                                        prefix: const Align(
                                          alignment: Alignment.topCenter,
                                          heightFactor: 4.8,
                                          widthFactor: 1,
                                          child: Icon(
                                            Icons.home_outlined,
                                          ),
                                        ),
                                        maxLines: 5,
                                        validator: (value) =>
                                            CustomValidators.validateRequired(
                                                value),
                                      ),
                                      const Gap(10),
                                      PrimaryFormField(
                                        controller: _educationController,
                                        lText: 'Education',
                                        prefix: const Icon(
                                            Icons.location_on_outlined),
                                        maxLines: 1,
                                        validator: (value) =>
                                            CustomValidators.validateRequired(
                                                value),
                                      ),
                                      const Gap(10),
                                      Consumer<AuthProvider>(
                                        builder: (context, provider, _) {
                                          return PrimaryButton(
                                            btncolor: Colors.black,
                                            txtcolor: Colors.white,
                                            text: 'Continue',
                                            onTap: () => _register(),
                                            isLoading: provider.isBusy,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _educationController.dispose();
    // _localityController.dispose();
    _addressController.dispose();
    _ageController.dispose();
    _genderController.dispose();
    _confirmPasswordController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    if (_tabController.index == 0) {
      if (_formKey.currentState!.validate()) {
        _tabController.animateTo(1);
      }
      return;
    }
    if (_formKey1.currentState!.validate()) {
      await context.read<AuthProvider>().register(
            email: _emailController.text,
            name: _nameController.text,
            passWord: _passwordController.text,
            phoneNumber: _phoneController.text,
            gender: _genderController.text,
            age: _ageController.text,
            address: _addressController.text,
            // locality: _localityController.text,
            education: _educationController.text,
          );
    }
  }
}
