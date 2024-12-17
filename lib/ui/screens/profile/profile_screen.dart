import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jus/core/routes/app_router.gr.dart';

import '../../../utils/extensions/build_context_extension.dart';
import '../../../utils/constants/app_typography.dart';
import '../../../utils/constants/app_dimensions.dart';
import '../../../utils/constants/app_images.dart';
import '../../widgets/buttons/primary_button.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => context.router.push(HomeRoute()),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.screenPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
                child: Text(
                  'My Profile',
                  style: AppTypography.headlineLarge.copyWith(
                    fontSize: 35,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  // border: Border.all(
                  //   color: Colors.black,
                  //   width: 2,
                  // ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 5),
                    ),
                  ],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(45),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    child: ClipOval(
                      child: Image(
                        image: AssetImage(AppImages.sampleImage),
                        fit: BoxFit.fill,
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ),
                  title: Text(
                    'Khamarudheen C H',
                    style: AppTypography.titleLarge,
                  ),
                  subtitle: Text(
                    'lazimnihal@joblocalee.com',
                    style: AppTypography.bodyMedium,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 500,
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  primary: false,
                  padding: EdgeInsets.all(10.0),
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                  crossAxisCount: 2,
                  children: [
                    _profileTiles(
                      text: 'Edit\nProfile',
                      icon: Icons.edit_outlined,
                      color: Colors.greenAccent.shade100,
                    ),
                    _profileTiles(
                      text: 'Edit\nProfile',
                      icon: Icons.edit_outlined,
                      color: Colors.blueAccent.shade100,
                    ),
                    _profileTiles(
                      text: 'Edit\nProfile',
                      icon: Icons.edit_outlined,
                      color: Colors.amber.shade100,
                    ),
                    _profileTiles(
                      text: 'Edit\nProfile',
                      icon: Icons.edit_outlined,
                      color: Colors.red.shade100,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _profileTiles extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;

  const _profileTiles({
    super.key,
    required this.text,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.centerLeft,
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
                      size: 30,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(text, style: AppTypography.titleLarge),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
