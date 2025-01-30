import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/app_typography.dart';
import '../../../utils/extensions/build_context_extension.dart';
import '../../../core/routes/app_router.gr.dart';
import '../../../utils/constants/app_images.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isPersonalInfoExpanded = false;
  bool _isContactInfoExpanded = false;
  bool _isAcademicInfoExpanded = false;

  void _toggleExpansion(bool Function() currentStatus) {
    setState(() {
      currentStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Profile',
          style: AppTypography.titleLarge,
        ),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            context.router.maybePop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () {
              context.router.push(const EditProfileRoute());
            },
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Center(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.screenPadding,
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          AppImages.profileImage2,
                        ),
                        radius: 50,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Muhammed Shamil',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'muhammedshamil@joblocalee.com',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            ListTile(
              leading: const Icon(
                Icons.person_outline,
              ),
              title: const Text(
                'Personal Details',
              ),
              trailing: Icon(_isPersonalInfoExpanded
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down),
              onTap: () => _toggleExpansion(
                  () => _isPersonalInfoExpanded = !_isPersonalInfoExpanded),
            ),
            AnimatedContainer(
              duration: const Duration(
                milliseconds: 300,
              ),
              child: _isPersonalInfoExpanded
                  ? const Column(
                      children: [
                        ListTile(
                          title: Text(
                            'Maksudur Rahman',
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'maksud.design7@gmail.com',
                          ),
                        ),
                        ListTile(
                          title: Text(
                            '+880 1924699597',
                          ),
                        ),
                        ListTile(
                          title: Text(
                            '119 North Jatrabari, Dhaka 1204',
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(
                      width: double.infinity,
                    ),
            ),
            ListTile(
              leading: const Icon(
                Icons.phone,
              ),
              title: const Text(
                'Contact Details',
              ),
              trailing: Icon(_isContactInfoExpanded
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down),
              onTap: () => _toggleExpansion(
                  () => _isContactInfoExpanded = !_isContactInfoExpanded),
            ),
            AnimatedContainer(
              duration: const Duration(
                milliseconds: 300,
              ),
              child: _isContactInfoExpanded
                  ? const Column(
                      children: [
                        ListTile(
                          title: Text(
                            'Maksudur Rahman',
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'maksud.design7@gmail.com',
                          ),
                        ),
                        ListTile(
                          title: Text(
                            '+880 1924699597',
                          ),
                        ),
                        ListTile(
                          title: Text(
                            '119 North Jatrabari, Dhaka 1204',
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(
                      width: double.infinity,
                    ),
            ),
            ListTile(
              leading: const Icon(
                Icons.library_books_outlined,
              ),
              title: const Text(
                'Academic Details',
              ),
              trailing: Icon(_isAcademicInfoExpanded
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down),
              onTap: () => _toggleExpansion(
                  () => _isAcademicInfoExpanded = !_isAcademicInfoExpanded),
            ),
            AnimatedContainer(
              duration: const Duration(
                milliseconds: 300,
              ),
              child: _isAcademicInfoExpanded
                  ? const Column(
                      children: [
                        ListTile(
                          title: Text(
                            'Maksudur Rahman',
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'maksud.design7@gmail.com',
                          ),
                        ),
                        ListTile(
                          title: Text(
                            '+880 1924699597',
                          ),
                        ),
                        ListTile(
                          title: Text(
                            '119 North Jatrabari, Dhaka 1204',
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(
                      width: double.infinity,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption({
    required IconData icon,
    required String title,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
