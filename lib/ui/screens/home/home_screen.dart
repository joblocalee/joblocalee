import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jus/ui/screens/home/home_tab_screen.dart';

import '../../../utils/constants/app_images.dart';
import '../../../utils/constants/app_typography.dart';
import '../../../utils/extensions/build_context_extension.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            context.router.pushNamed('/login');
          },
        ),
        title: const Text('Job Localee',
          textAlign: TextAlign.center,
          style: AppTypography.headlineLarge,
        ),
      ),
      body: SafeArea(
          child:SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.screenPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Gap(30),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 5),
                        ),
                      ],
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: const ListTile(
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
                      title: Text('Lazim Nihal',
                        style: AppTypography.titleLarge,
                      ),
                      subtitle: Text('lazimnihal@joblocalee.com',
                        style: AppTypography.bodyMedium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

      ),
    );
  }
}