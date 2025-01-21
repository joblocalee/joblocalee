import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jus/utils/constants/app_dimensions.dart';

import '../../../utils/extensions/build_context_extension.dart';
import '../../../core/routes/app_router.gr.dart';
import '../../../utils/constants/app_typography.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            context.router.push(MenuRoute());
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.screenPadding,
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 5),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.25),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.account_circle_outlined,
                              size: 20.0,
                            ),
                            Gap(4.0),
                            Text(
                              'About Me',
                              style: AppTypography.bodyLarge.copyWith(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 16,
                          left: 16,
                          right: 16,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _CategoryTile(
                                titleText: 'Name',
                                subText: 'Muhammed Shamil',
                              ),
                              Divider(
                                color: Colors.grey.withOpacity(0.25),
                                thickness: 2,
                              ),
                              _CategoryTile(
                                titleText: 'Age',
                                subText: '21',
                              ),
                              Divider(
                                color: Colors.grey.withOpacity(0.25),
                                thickness: 2,
                              ),
                              _CategoryTile(
                                titleText: 'Email',
                                subText: 'muhammedshamil@gmail.com',
                              ),
                              Divider(
                                color: Colors.grey.withOpacity(0.25),
                                thickness: 2,
                              ),
                              _CategoryTile(
                                titleText: 'Phone Number',
                                subText: '+91 98765 43210',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(AppDimensions.gapXXL),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 5),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.25),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.school_outlined,
                              size: 20.0,
                            ),
                            Gap(4.0),
                            Text(
                              'Academics',
                              style: AppTypography.bodyLarge.copyWith(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 16,
                          left: 16,
                          right: 16,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _CategoryTile(
                                titleText: 'Name',
                                subText: 'Muhammed Shamil',
                              ),
                              Divider(
                                color: Colors.grey.withOpacity(0.25),
                                thickness: 2,
                              ),
                              _CategoryTile(
                                titleText: 'Age',
                                subText: '21',
                              ),
                              Divider(
                                color: Colors.grey.withOpacity(0.25),
                                thickness: 2,
                              ),
                              _CategoryTile(
                                titleText: 'Email',
                                subText: 'muhammedshamil@gmail.com',
                              ),
                              Divider(
                                color: Colors.grey.withOpacity(0.25),
                                thickness: 2,
                              ),
                              _CategoryTile(
                                titleText: 'Phone Number',
                                subText: '+91 98765 43210',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(MediaQuery.paddingOf(context).bottom + 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CategoryTile extends StatelessWidget {
  final String titleText;
  final String subText;

  const _CategoryTile({
    super.key,
    required this.titleText,
    required this.subText,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(8.0),
        minTileHeight: 1,
        title: Text(
          titleText,
          style: AppTypography.labelLarge.copyWith(
            color: Colors.black45,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          subText,
          style: AppTypography.labelLarge.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
