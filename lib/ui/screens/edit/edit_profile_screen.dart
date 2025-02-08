import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jus/ui/widgets/buttons/primary_button.dart';

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
      backgroundColor: Colors.blue,
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
                              ),
                              Gap(AppDimensions.gapLarge),
                              PrimaryFormField(
                                lText: 'Gender',
                              ),
                              Gap(AppDimensions.gapLarge),
                              PrimaryFormField(
                                lText: 'Age',
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
                              ),
                              Gap(AppDimensions.gapLarge),
                              PrimaryFormField(
                                lText: 'Contact',
                              ),
                              Gap(AppDimensions.gapLarge),
                              PrimaryFormField(
                                lText: 'Locality',
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
                              ),
                              Gap(AppDimensions.gapLarge),
                              PrimaryFormField(
                                lText: 'Skills',
                              ),
                              Gap(AppDimensions.gapLarge),
                              PrimaryFormField(
                                lText: 'Preferences',
                              ),
                              Gap(AppDimensions.gapLarge),
                              PrimaryFormField(
                                lText: 'Experience',
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
