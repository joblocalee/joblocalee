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
      backgroundColor: Colors.blue.shade50,
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
              tileColor: Color(
                _isPersonalInfoExpanded ? 0xFFFFFFFF : 0xFFE3F2FD,
              ),
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
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              duration: const Duration(
                milliseconds: 300,
              ),
              child: _isPersonalInfoExpanded
                  ? Padding(
                      padding: const EdgeInsets.only(
                        left: 16.0,
                      ),
                      child: Column(
                        children: [
                          _ProfileDetails(
                            title: 'Name',
                            subtitle: 'Muhammed Shamil',
                          ),
                          _ProfileDetails(
                            title: 'Gender',
                            subtitle: 'Male',
                          ),
                          _ProfileDetails(
                            title: 'Age',
                            subtitle: '21',
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(
                      width: double.infinity,
                    ),
            ),
            ListTile(
              tileColor: Color(
                _isContactInfoExpanded ? 0xFFFFFFFF : 0xFFE3F2FD,
              ),
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
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              duration: const Duration(
                milliseconds: 300,
              ),
              child: _isContactInfoExpanded
                  ? Padding(
                      padding: const EdgeInsets.only(
                        left: 16.0,
                      ),
                      child: Column(
                        children: [
                          _ProfileDetails(
                            title: 'Email',
                            subtitle: 'muhammedshamil@joblocalee.com',
                          ),
                          _ProfileDetails(
                            title: 'Phone Number',
                            subtitle: '+91 98765 43210',
                          ),
                          _ProfileDetails(
                            title: 'Address',
                            subtitle: '',
                          ),
                          _ProfileDetails(
                            title: 'Locality',
                            subtitle: 'Payyanur',
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(
                      width: double.infinity,
                    ),
            ),
            ListTile(
              tileColor: Color(
                _isAcademicInfoExpanded ? 0xFFFFFFFF : 0xFFE3F2FD,
              ),
              leading: const Icon(
                Icons.library_books_outlined,
              ),
              title: const Text(
                'Skills & Education',
              ),
              trailing: Icon(_isAcademicInfoExpanded
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down),
              onTap: () => _toggleExpansion(
                  () => _isAcademicInfoExpanded = !_isAcademicInfoExpanded),
            ),
            AnimatedContainer(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              duration: const Duration(
                milliseconds: 300,
              ),
              child: _isAcademicInfoExpanded
                  ? Padding(
                      padding: const EdgeInsets.only(
                        left: 16.0,
                      ),
                      child: Column(
                        children: [
                          _ProfileDetails(
                            title: 'Education',
                            subtitle: '',
                          ),
                          _ProfileDetails(
                            title: 'Skills',
                            subtitle: '',
                          ),
                          _ProfileDetails(
                            title: 'Preferences',
                            subtitle: '',
                          ),
                        ],
                      ),
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
}

class _ProfileDetails extends StatelessWidget {
  final String title;
  final String subtitle;

  const _ProfileDetails({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: AppTypography.bodyMedium.copyWith(
          color: Colors.grey,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: AppTypography.bodyMedium.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
