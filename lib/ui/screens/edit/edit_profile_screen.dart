import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../widgets/buttons/primary_button.dart';
import '../../widgets/primary_form_field.dart';
import '../../../utils/constants/app_dimensions.dart';
import '../../../utils/extensions/build_context_extension.dart';
import '../../../utils/constants/app_typography.dart';

@RoutePage()
class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
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
              physics: BouncingScrollPhysics(),
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.screenPadding,
                    vertical: context.screenPadding,
                  ),
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
                                  color: Colors.blue,
                                ),
                              ),
                              Gap(AppDimensions.gapLarge),
                              PrimaryFormField(
                                lText: 'Name',
                                maxLines: 1,
                              ),
                              Gap(AppDimensions.gapLarge),
                              PrimaryFormField(
                                lText: 'Gender',
                                maxLines: 1,
                              ),
                              Gap(AppDimensions.gapLarge),
                              PrimaryFormField(
                                lText: 'Age',
                                maxLines: 1,
                              ),
                              Gap(AppDimensions.gapMedium),
                            ],
                          ),
                        ),
                      ),
                      Gap(AppDimensions.gapXXL),
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
                                  color: Colors.blue,
                                ),
                              ),
                              Gap(AppDimensions.gapLarge),
                              PrimaryFormField(
                                lText: 'Email',
                                maxLines: 1,
                              ),
                              Gap(AppDimensions.gapLarge),
                              PrimaryFormField(
                                lText: 'Contact',
                                maxLines: 1,
                              ),
                              Gap(AppDimensions.gapLarge),
                              PrimaryFormField(
                                lText: 'Locality',
                                maxLines: 1,
                              ),
                              Gap(AppDimensions.gapLarge),
                              PrimaryFormField(
                                lText: 'Address',
                                maxLines: 5,
                              ),
                              Gap(AppDimensions.gapMedium),
                            ],
                          ),
                        ),
                      ),
                      Gap(AppDimensions.gapXXL),
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
                                'Skills & Education',
                                style: AppTypography.headlineLarge.copyWith(
                                  fontSize: 20.0,
                                  color: Colors.blue,
                                ),
                              ),
                              Gap(AppDimensions.gapLarge),
                              PrimaryFormField(
                                lText: 'Education',
                                maxLines: 1,
                              ),
                              Gap(AppDimensions.gapLarge),
                              PrimaryFormField(
                                lText: 'Skills',
                                maxLines: 1,
                              ),
                              Gap(AppDimensions.gapLarge),
                              PrimaryFormField(
                                lText: 'Preferences',
                                maxLines: 1,
                              ),
                              Gap(AppDimensions.gapLarge),
                              PrimaryFormField(
                                lText: 'Experience',
                                maxLines: 1,
                              ),
                              Gap(AppDimensions.gapMedium),
                            ],
                          ),
                        ),
                      ),
                      Gap(MediaQuery.paddingOf(context).bottom + 75),
                    ],
                  ),
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
              child: PrimaryButton(
                text: 'Update Profile',
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
