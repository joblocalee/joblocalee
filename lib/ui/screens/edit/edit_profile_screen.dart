import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/injection/injection.dart';
import '../../../core/provider/auth_provider.dart';
import '../../../utils/helper/custom_validators.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/primary_form_field.dart';
import '../../../utils/constants/app_dimensions.dart';
import '../../../utils/extensions/build_context_extension.dart';
import '../../../utils/constants/app_typography.dart';

@RoutePage()
class EditProfileScreen extends StatefulWidget implements AutoRouteWrapper {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();

  @override
  Widget wrappedRoute(BuildContext context) => ChangeNotifierProvider.value(
        value: locator<AuthProvider>(),
        child: this,
      );
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _genderController;
  late final TextEditingController _ageController;
  late final TextEditingController _addressController;

  // late final TextEditingController  _localityController;
  late final TextEditingController _educationController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _genderController = TextEditingController();
    _ageController = TextEditingController();
    _addressController = TextEditingController();
    // _localityController = TextEditingController();
    _educationController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
          style: AppTypography.titleLarge,
        ),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            context.router.maybePop();
          },
        ),
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.screenPadding,
                    vertical: context.screenPadding,
                  ),
                  child:
                      Consumer<AuthProvider>(builder: (context, provider, _) {
                    return Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Personal Details',
                                    style: AppTypography.headlineLarge.copyWith(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  const Gap(AppDimensions.gapLarge),
                                  PrimaryFormField(
                                    lText: 'Name',
                                    controller: _nameController,
                                    initialText: provider.user?.name,
                                    maxLines: 1,
                                    validator: (value) =>
                                        CustomValidators.validateRequired(
                                      value,
                                    ),
                                  ),
                                  const Gap(AppDimensions.gapLarge),
                                  PrimaryFormField(
                                    lText: 'Gender',
                                    controller: _genderController,
                                    initialText: provider.user?.gender,
                                    maxLines: 1,
                                    validator: (value) =>
                                        CustomValidators.validateRequired(
                                            value),
                                  ),
                                  const Gap(AppDimensions.gapLarge),
                                  PrimaryFormField(
                                    lText: 'Age',
                                    controller: _ageController,
                                    initialText: provider.user?.age,
                                    maxLines: 1,
                                    validator: (value) =>
                                        CustomValidators.validateRequired(
                                            value),
                                  ),
                                  const Gap(AppDimensions.gapMedium),
                                ],
                              ),
                            ),
                          ),
                          const Gap(AppDimensions.gapXXL),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Contact Details',
                                    style: AppTypography.headlineLarge.copyWith(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  const Gap(AppDimensions.gapLarge),
                                  PrimaryFormField(
                                    lText: 'Email',
                                    controller: _emailController,
                                    initialText: provider.user?.email,
                                    maxLines: 1,
                                    validator: (value) =>
                                        CustomValidators.validateEmail(value),
                                  ),
                                  const Gap(AppDimensions.gapLarge),
                                  PrimaryFormField(
                                    lText: 'Contact',
                                    controller: _phoneController,
                                    initialText: provider.user?.phone,
                                    maxLines: 1,
                                    validator: (value) =>
                                        CustomValidators.validateRequired(
                                            value),
                                  ),
                                  const Gap(AppDimensions.gapLarge),
                                  // PrimaryFormField(
                                  //   lText: 'Locality',
                                  //   maxLines: 1,
                                  // ),
                                  // Gap(AppDimensions.gapLarge),
                                  PrimaryFormField(
                                    lText: 'Address',
                                    controller: _addressController,
                                    initialText: provider.user?.address,
                                    maxLines: 5,
                                    validator: (value) =>
                                        CustomValidators.validateRequired(
                                            value),
                                  ),
                                  const Gap(AppDimensions.gapMedium),
                                ],
                              ),
                            ),
                          ),
                          const Gap(AppDimensions.gapXXL),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Other Details',
                                    style: AppTypography.headlineLarge.copyWith(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  const Gap(AppDimensions.gapLarge),
                                  PrimaryFormField(
                                    lText: 'Education',
                                    controller: _educationController,
                                    initialText: provider.user?.education,
                                    maxLines: 1,
                                    validator: (value) =>
                                        CustomValidators.validateRequired(
                                            value),
                                  ),
                                  const Gap(AppDimensions.gapLarge),
                                  // PrimaryFormField(
                                  //   lText: 'Skills',
                                  //   maxLines: 1,
                                  // ),
                                  // Gap(AppDimensions.gapLarge),
                                  // PrimaryFormField(
                                  //   lText: 'Preferences',
                                  //   maxLines: 1,
                                  // ),
                                  // Gap(AppDimensions.gapLarge),
                                  // PrimaryFormField(
                                  //   lText: 'Experience',
                                  //   maxLines: 1,
                                  // ),
                                  // Gap(AppDimensions.gapMedium),
                                ],
                              ),
                            ),
                          ),
                          Gap(MediaQuery.paddingOf(context).bottom + 75),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.screenPadding,
                vertical: context.screenPadding,
              ),
              child: Consumer(
                builder: (context, provider, _) {
                  return PrimaryButton(
                    text: 'Update Profile',
                    btncolor: Colors.black,
                    txtcolor: Colors.white,
                    onTap: () => _editProfile(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _educationController.dispose();
    // _localityController.dispose();
    _addressController.dispose();
    _ageController.dispose();
    _genderController.dispose();
    _phoneController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _editProfile() async {
    bool result = false;
    if (_formKey.currentState!.validate()) {
      result = await context.read<AuthProvider>().editProfile(
            email: _emailController.text,
            name: _nameController.text,
            phoneNumber: _phoneController.text,
            gender: _genderController.text,
            age: _ageController.text,
            address: _addressController.text,
            // locality: _localityController.text,
            education: _educationController.text,
          );
    }
    if (result && mounted) {
      context.router.popForced();
    }
  }
}
