import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/routes/app_router.gr.dart';
import '../../../utils/extensions/build_context_extension.dart';
import '../../../utils/constants/app_typography.dart';
import '../../../utils/constants/app_images.dart';

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
            horizontal: context.screenPadding * 0.5,
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
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 10,
                      offset: const Offset(-5, 5),
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
                        image: AssetImage(AppImages.profileImage),
                        fit: BoxFit.cover,
                        width: 100,
                      ),
                    ),
                  ),
                  title: Text(
                    'Muhammed Nihal M P',
                    style: AppTypography.titleLarge,
                  ),
                  subtitle: Text(
                    'muhammednihal@joblocalee.com',
                    style: AppTypography.bodyMedium,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 500,
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  primary: false,
                  padding: EdgeInsets.all(5.0),
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                  crossAxisCount: 2,
                  children: [
                    _ProfileTiles(
                      text: 'Edit\nProfile',
                      icon: Icons.edit_outlined,
                      color: Colors.blueAccent.shade100,
                      onTap: (){
                        context.router.push(EditProfileRoute());
                      },
                    ),
                    _ProfileTiles(
                      text: 'App\nNotifications',
                      icon: Icons.notifications_none,
                      color: Colors.greenAccent.shade100,
                      onTap: (){
                        context.router.push(AppNotificationRoute());
                      },
                    ),
                    _ProfileTiles(
                      text: 'Applied\nJobs',
                      icon: Icons.work_outline_rounded,
                      color: Colors.amberAccent.shade100,
                      onTap: (){
                        context.router.push(AppliedJobsRoute());
                      },
                    ),
                    _ProfileTiles(
                      text: 'Edit\nProfile',
                      icon: Icons.edit_outlined,
                      color: Colors.redAccent.shade100,
                      onTap: (){
                        context.router.push(EditProfileRoute());
                      },
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

class _ProfileTiles extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _ProfileTiles({
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
                offset: const Offset(-5, 5),
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
                        size: 32,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(text,
                      style: AppTypography.titleLarge.copyWith(
                        fontSize: 22,
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
