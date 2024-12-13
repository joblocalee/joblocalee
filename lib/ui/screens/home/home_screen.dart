import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(10),
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
                      title: Text('Khamarudheen C H',
                        style: AppTypography.titleLarge,
                      ),
                      subtitle: Text('lazimnihal@joblocalee.com',
                        style: AppTypography.bodyMedium,
                      ),
                    ),
                  ),
                  Gap(20),
                  Text('New Openings',
                    style: AppTypography.headlineMedium,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 55,
                    child: ListView.builder(
                      padding: EdgeInsets.only(),
                      itemCount: 5,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => _category(),

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

class _category extends StatelessWidget {
  const _category({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4,left: 4),
      child: Container(
          alignment: Alignment(0, 0),
          height: 50,
          width: 130,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(45),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black.withOpacity(0.1),
            //     spreadRadius: 0.5,
            //     blurRadius: 10,
            //     offset: const Offset(0, 0),
            //   ),
            // ],
          ),
          child:
          Text(
            'Recent',
            style: AppTypography.bodyLarge.copyWith(
              color: Colors.black,
            ),
          ),
        ),
    );
  }
}
