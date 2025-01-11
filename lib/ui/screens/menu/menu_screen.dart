import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jus/ui/widgets/primary_form_field.dart';
import 'package:jus/ui/widgets/profile_text_field.dart';
import 'package:jus/utils/constants/app_dimensions.dart';

import '../../../utils/extensions/build_context_extension.dart';
import '../../widgets/buttons/ink_well_material.dart';
import '../../../core/routes/app_router.gr.dart';
import '../../../utils/constants/app_images.dart';
import '../../../utils/constants/app_typography.dart';

@RoutePage()
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => context.router.push(HomeRoute()),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.screenPadding * 0.75,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWellMaterial(
                  onTap: () {
                    context.router.push(ProfileRoute());
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 10,
                    ),
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
                            image: AssetImage(AppImages.profileImage2),
                            fit: BoxFit.cover,
                            width: 100,
                          ),
                        ),
                      ),
                      title: Text(
                        'Muhammed Shamil',
                        style: AppTypography.titleLarge,
                      ),
                      subtitle: Text(
                        'muhammedshamil@joblocalee.com',
                        style: AppTypography.bodyMedium,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 145,
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    primary: false,
                    crossAxisCount: 3,
                    children: [
                      _ProfileTile(
                        text: 'Edit\nProfile',
                        icon: Icons.edit_outlined,
                        color: Colors.blueAccent.shade100,
                        onTap: () {
                          context.router.push(EditProfileRoute());
                        },
                      ),
                      _ProfileTile(
                        text: 'Applied\nJobs',
                        icon: Icons.work_outline_rounded,
                        color: Colors.amberAccent.shade100,
                        onTap: () {
                          context.router.push(AppliedJobsRoute());
                        },
                      ),
                      _ProfileTile(
                        text: 'App\nNotifications',
                        icon: Icons.notifications_none,
                        color: Colors.greenAccent.shade100,
                        onTap: () {
                          context.router.push(AppNotificationRoute());
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Security',
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
                            icon: Icons.lock_outline_rounded,
                            text: 'Upadte Password',
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: context.screenPadding,
                                        vertical: context.screenPadding,
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Update Password',
                                            style: AppTypography.titleLarge,
                                          ),
                                          Gap(AppDimensions.gapMedium),
                                          PrimaryFormField(
                                            lText: 'Current Password',
                                            prefix: Icon(
                                              Icons.lock_outline_rounded,
                                            ),
                                            isPassWord: true,
                                          ),
                                          Gap(AppDimensions.gapMedium),
                                          PrimaryFormField(
                                            lText: 'New Password',
                                            prefix: Icon(
                                              Icons.lock_outline_rounded,
                                            ),
                                            isPassWord: true,
                                          ),
                                          Gap(AppDimensions.gapMedium),
                                          PrimaryFormField(
                                            lText: 'Retype Password',
                                            prefix: Icon(
                                              Icons.lock_outline_rounded,
                                            ),
                                            isPassWord: true,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          Divider(
                            color: Colors.grey.withOpacity(0.25),
                            thickness: 2,
                          ),
                          _CategoryTile(
                            icon: Icons.mail_outline_rounded,
                            text: 'Update Email',
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: context.screenPadding,
                                        vertical: context.screenPadding,
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Update E-mail',
                                            style: AppTypography.titleLarge,
                                          ),
                                          Gap(AppDimensions.gapMedium),
                                          PrimaryFormField(
                                            lText: 'E-mail',
                                            prefix: Icon(
                                              Icons.email_outlined,
                                            ),
                                            isPassWord: false,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          Divider(
                            color: Colors.grey.withOpacity(0.25),
                            thickness: 2,
                          ),
                          _CategoryTile(
                            icon: Icons.phone,
                            text: 'Upadte Phone Number',
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: context.screenPadding,
                                        vertical: context.screenPadding,
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Update Phone Number',
                                            style: AppTypography.titleLarge,
                                          ),
                                          Gap(AppDimensions.gapMedium),
                                          PrimaryFormField(
                                            lText: 'Phone Number',
                                            prefix: Icon(
                                              Icons.phone,
                                            ),
                                            isPassWord: false,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
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
                      'Others',
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
                            icon: Icons.support_agent_rounded,
                            text: 'Help & Support',
                            onTap: () {},
                          ),
                          Divider(
                            color: Colors.grey.withOpacity(0.25),
                            thickness: 2,
                          ),
                          _CategoryTile(
                            icon: Icons.feedback_outlined,
                            text: 'Feedback',
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
              child: Column(
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
                  SizedBox(
                    height: 16,
                  ),
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
