import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jus/utils/helper/custom_validators.dart';
import 'package:provider/provider.dart';

import '../../../core/injection/injection.dart';
import '../../../core/provider/auth_provider.dart';
import '../../../utils/constants/app_dimensions.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/primary_form_field.dart';
import '../../../utils/extensions/build_context_extension.dart';
import '../../widgets/buttons/ink_well_material.dart';
import '../../../core/routes/app_router.gr.dart';
import '../../../utils/constants/app_images.dart';
import '../../../utils/constants/app_typography.dart';

@RoutePage()
class MenuScreen extends StatefulWidget implements AutoRouteWrapper {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();

  @override
  Widget wrappedRoute(BuildContext context) => ChangeNotifierProvider.value(
        value: locator<AuthProvider>(),
        child: this,
      );
}

class _MenuScreenState extends State<MenuScreen> {
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late TextEditingController _newPasswordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: Stack(
        children: [
          SizedBox.expand(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.only(
                  left: context.screenPadding,
                  right: context.screenPadding,
                  top: context.safeTopStrict + 20,
                  bottom: context.safeBottom,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Consumer<AuthProvider>(builder: (context, provider, _) {
                      return InkWellMaterial(
                        borderRadius: 45,
                        onTap: () {
                          context.router.push(ProfileRoute());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(45),
                          ),
                          child: ListTile(
                            minVerticalPadding: 15,
                            leading: CircleAvatar(
                              radius: 25,
                              child: ClipOval(
                                child: Image(
                                  image: AssetImage(AppImages.splashImage),
                                  fit: BoxFit.cover,
                                  width: 100,
                                ),
                              ),
                            ),
                            title: Text(
                              provider.user!.name,
                              style: AppTypography.titleLarge,
                            ),
                            subtitle: Text(
                              provider.user!.email,
                              style: AppTypography.bodyMedium,
                            ),
                          ),
                        ),
                      );
                    }),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        // Expanded(
                        //   child: _ProfileTile(
                        //     text: 'Edit\nProfile',
                        //     icon: Icons.edit_outlined,
                        //     color: Colors.blueAccent.shade100,
                        //     onTap: () {
                        //       context.router.push(EditProfileRoute());
                        //     },
                        //   ),
                        // ),
                        Expanded(
                          child: _ProfileTile(
                            text: 'Applied\nJobs',
                            icon: Icons.work_outline_rounded,
                            color: Colors.amberAccent.shade100,
                            onTap: () {
                              context.router.push(AppliedJobsRoute());
                            },
                          ),
                        ),
                        Expanded(
                          child: _ProfileTile(
                            text: 'App\nNotifications',
                            icon: Icons.notifications_none,
                            color: Colors.greenAccent.shade100,
                            onTap: () {
                              context.router.push(AppNotificationRoute());
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Account Settings',
                          style: AppTypography.labelLarge.copyWith(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _CategoryTile(
                                icon: Icons.edit_outlined,
                                text: 'Update Profile',
                                onTap: () {
                                  context.router.push(EditProfileRoute());
                                },
                              ),
                              Divider(
                                color: Colors.grey.withOpacity(0.25),
                                thickness: 2,
                              ),
                              Consumer<AuthProvider>(
                                  builder: (context, provider, _) {
                                return _CategoryTile(
                                  icon: Icons.lock_outline_rounded,
                                  text: 'Update Password',
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Form(
                                          key: _formKey,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: context.screenPadding,
                                              vertical: context.screenPadding,
                                            ),
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Update Password',
                                                  style:
                                                      AppTypography.titleLarge,
                                                ),
                                                Gap(AppDimensions.gapMedium),
                                                PrimaryFormField(
                                                  controller: _passwordController,
                                                  lText: 'Current Password',
                                                  prefix: Icon(
                                                    Icons.lock_outline_rounded,
                                                  ),
                                                  isPassWord: true,
                                                  maxLines: 1,
                                                  validator: (value) => CustomValidators.validatePassword(value),
                                                ),
                                                Gap(AppDimensions.gapMedium),
                                                PrimaryFormField(
                                                  controller: _newPasswordController,
                                                  lText: 'New Password',
                                                  prefix: Icon(
                                                    Icons.lock_outline_rounded,
                                                  ),
                                                  isPassWord: true,
                                                  maxLines: 1,
                                                  validator: (value) => CustomValidators.validatePassword(value),
                                                ),
                                                Gap(AppDimensions.gapMedium),
                                                PrimaryFormField(
                                                  controller: _confirmPasswordController,
                                                  lText: 'Retype Password',
                                                  prefix: Icon(
                                                    Icons.lock_outline_rounded,
                                                  ),
                                                  isPassWord: true,
                                                  maxLines: 1,
                                                  validator: (value) => CustomValidators.validatePassword(value),
                                                ),
                                                Gap(AppDimensions.buttonHeightPrimary),
                                                Consumer<AuthProvider>(
                                                  builder: (context, provider, _) {
                                                    return PrimaryButton(
                                                      btncolor: Colors.black,
                                                      txtcolor: Colors.white,
                                                      text: 'Update Password',
                                                      onTap: () => _updatePassword(),
                                                    );
                                                  }
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              }),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Support',
                          style: AppTypography.labelLarge.copyWith(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _CategoryTile(
                                icon: Icons.feedback_outlined,
                                text: 'FAQ',
                                onTap: () {},
                              ),
                              Divider(
                                color: Colors.grey.withOpacity(0.25),
                                thickness: 2,
                              ),
                              _CategoryTile(
                                icon: Icons.support_agent_rounded,
                                text: 'Help & Support',
                                onTap: () {},
                              ),
                              Divider(
                                color: Colors.grey.withOpacity(0.25),
                                thickness: 2,
                              ),
                              _CategoryTile(
                                icon: Icons.description_outlined,
                                text: 'Terms & Conditions',
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Gap(100),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: context.safeBottom,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.screenPadding,
                vertical: context.screenPadding,
              ),
              child: Selector<AuthProvider, bool>(
                selector: (context, provider) => provider.isBusy,
                builder: (context, isLoading, _) {
                  return PrimaryButton(
                    btncolor: Colors.red,
                    txtcolor: Colors.white,
                    isLoading: isLoading,
                    text: 'Logout',
                    onTap: () => _logout(context),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _logout(BuildContext context) => context.read<AuthProvider>().logout();

  @override
  void dispose() {
    _confirmPasswordController.dispose();
    _newPasswordController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _updatePassword() async {
    bool result = false;
    if (_formKey.currentState!.validate()) {
      result = await context.read<AuthProvider>().updatePassword(
        passWord: _passwordController.text,
        newPassWord: _newPasswordController.text,
      );
    }
    if (result && mounted) {
      context.router.popForced();
    }
  }
}

class _ProfileTile extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _ProfileTile({
    super.key,
    required this.text,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        icon,
                        size: 20,
                      ),
                    ),
                  ),
                  Gap(AppDimensions.gapRegular),
                  Text(
                    text,
                    style: AppTypography.titleLarge.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
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
}

class _CategoryTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const _CategoryTile({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWellMaterial(
      borderRadius: 20,
      onTap: onTap,
      child: ListTile(
        contentPadding: EdgeInsets.all(8.0),
        minTileHeight: 1,
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 20,
          child: Icon(
            icon,
            color: Colors.black87,
          ),
        ),
        title: Text(
          text,
          style: AppTypography.labelLarge.copyWith(
            color: Colors.black45,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          size: 30,
        ),
      ),
    );
  }
}
