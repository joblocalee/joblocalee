import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../utils/constants/app_images.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../../utils/constants/app_typography.dart';
import '../../../utils/extensions/build_context_extension.dart';

@RoutePage()
class JobDescriptionScreen extends StatelessWidget {
  const JobDescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            context.router.maybePop();
          },
        ),
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.screenPadding * 0.75,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                                AppImages.shopImage,
                                height: MediaQuery.sizeOf(context).width * 0.5,
                                width: MediaQuery.sizeOf(context).width,
                              ),
                            ),
                            Positioned(
                              top: 150,
                              child: Container(
                                padding: EdgeInsets.only(
                                  left: 16,
                                  bottom: 16,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.local_convenience_store_rounded,
                                          size: 28,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          'City Mart',
                                          style: AppTypography.titleLarge.copyWith(
                                            color: Colors.white,
                                            fontSize: 28,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on_outlined,
                                          size: 14,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          'Mainroad, Keloth, Payyanur',
                                          style: AppTypography.bodyLarge.copyWith(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.person,
                                size: 32,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Sales Executive',
                                style: AppTypography.titleLarge.copyWith(fontSize: 26),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                          right: 16,
                        ),
                        child: Column(
                          children: [
                            _DescriptonField(
                              icon: Icons.currency_rupee_rounded,
                              text1: '10,000 - 15,000',
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                padding: EdgeInsets.all(3.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.blueGrey.shade100,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.blueGrey.shade100,
                                ),
                                child: Text(
                                  '30 Vacancies',
                                  style: AppTypography.bodyLarge.copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blueGrey.shade100,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Job Highlights',
                              style: AppTypography.titleLarge,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            _DescriptonField(
                              icon: Icons.star_rounded,
                              text1: 'Experience: ',
                              text2: 'Less than 1 Year',
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            _DescriptonField(
                              icon: Icons.library_books_rounded,
                              text1: 'Qualification: ',
                              text2: 'Not required',
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            _DescriptonField(
                              icon: Icons.supervisor_account_rounded,
                              text1: 'Gender: ',
                              text2: 'Male/Female',
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Preferences',
                              style: AppTypography.titleLarge,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            _DescriptonField(
                              icon: Icons.sunny,
                              text1: 'Shift Time: ',
                              text2: 'Fulltime',
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Assets Required',
                              style: AppTypography.titleLarge,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Wrap(
                              direction: Axis.horizontal,
                              spacing: 8,
                              runSpacing: 8,
                              alignment: WrapAlignment.start,
                              children: List.generate(
                                5,
                                (index) => _AssetsCard(
                                  data: 'None',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blueGrey.shade100,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Job Description',
                              style: AppTypography.titleLarge,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                              style: AppTypography.bodyLarge.copyWith(
                                fontSize: 16,
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
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.screenPadding,
                vertical: context.screenPadding,
              ),
              child: PrimaryButton(
                text: 'Apply',
                onTap: (){},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AssetsCard extends StatelessWidget {
  final String data;

  const _AssetsCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.blueGrey.shade300,
        ),
        borderRadius: BorderRadius.circular(8),
        color: Colors.blueGrey.shade100,
      ),
      child: Text(
        data,
        style: AppTypography.bodyLarge.copyWith(
          fontSize: 14,
        ),
      ),
    );
  }
}

class _DescriptonField extends StatelessWidget {
  final IconData icon;
  final String text1;
  final String? text2;

  const _DescriptonField(
      {super.key, required this.icon, required this.text1, this.text2});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 22,
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          text1,
          style: AppTypography.bodyLarge.copyWith(fontSize: 16),
        ),
        if (text2 != null) ...<Widget>[
          SizedBox(
            width: 8,
          ),
          Text(
            text2 ?? '',
            style: AppTypography.bodyLarge.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ],
    );
  }
}
