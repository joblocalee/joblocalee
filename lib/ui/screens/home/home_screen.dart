import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jus/utils/constants/app_images.dart';

import '../../../utils/constants/app_dimensions.dart';
import '../../../utils/constants/app_typography.dart';
import '../../../utils/extensions/build_context_extension.dart';
import '../../widgets/buttons/primary_button.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: BackButton(
          onPressed: () {
            context.router.pushNamed('/login');
          },
        ),
        // title: Text('Job Localee',
        //   textAlign: TextAlign.center,
        //   style: AppTypography.headlineLarge.copyWith(
        //     fontSize: 25,
        //   ),
        // ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.screenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'New Openings',
                  style: AppTypography.headlineMedium.copyWith(
                    fontSize: 35,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    itemCount: 7,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => _category(),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                      bottom: 8,
                    ),
                    child: SizedBox(
                      height: 620,
                      child: ListView.builder(
                        itemCount: 20,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => _jobCard(),
                      ),
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

class _category extends StatelessWidget {
  const _category({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4, left: 4),
      child: Container(
        alignment: Alignment(0, 0),
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.blue,
          ),
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
        child: Text(
          'Recent',
          style: AppTypography.labelLarge.copyWith(
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}

class _jobCard extends StatelessWidget {
  const _jobCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(AppDimensions.gapRegular),
          Container(
            height: 175,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                // BoxShadow(
                //   color: Colors.grey.shade300,
                //   blurRadius: 5,
                //   offset: Offset(-10, 8),
                // ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: 1,
                right: 1,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        AppImages.sampleImage,
                        fit: BoxFit.fill,
                        width: 125,
                        height: 175,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                      right: 10.0,
                      bottom: 10.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sales Executive',
                          style: AppTypography.titleLarge,
                        ),
                        Text(
                          'Fulltime',
                          style: AppTypography.bodyMedium,
                        ),
                        Gap(58),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: 208,
                            child: PrimaryButton(
                              onTap: () {},
                              text: 'Apply',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
