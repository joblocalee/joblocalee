import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/injection/injection.dart';
import '../../../core/provider/vacancy_provider.dart';
import '../../../core/model/vacancy/vacancy_model.dart';
import '../../../utils/constants/app_images.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../../utils/constants/app_typography.dart';
import '../../../utils/extensions/build_context_extension.dart';

@RoutePage()
class JobDescriptionScreen extends StatelessWidget implements AutoRouteWrapper{
  final VacancyModel vacancy;
  final bool hasApplied;

  const JobDescriptionScreen({
    super.key,
    required this.vacancy,
    this.hasApplied = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
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
                      Gap(MediaQuery.paddingOf(context).bottom + 20),
                      Stack(
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
                                        vacancy.shops.shopName,
                                        style:
                                            AppTypography.titleLarge.copyWith(
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
                                        vacancy.shops.address,
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
                                vacancy.title,
                                style: AppTypography.titleLarge
                                    .copyWith(fontSize: 26),
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
                              text1: vacancy.salary,
                            ),
                            // SizedBox(
                            //   height: 8,
                            // ),
                            // Align(
                            //   alignment: Alignment.centerLeft,
                            //   child: Container(
                            //     padding: EdgeInsets.all(8.0),
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(8.0),
                            //       color: Colors.white,
                            //     ),
                            //     child: Text(
                            //       '30 Vacancies',
                            //       style: AppTypography.bodyLarge.copyWith(
                            //         fontSize: 14,
                            //       ),
                            //     ),
                            //   ),
                            // ),
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
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Preferences',
                              style: AppTypography.titleLarge,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            _DescriptonField(
                              icon: Icons.star_rounded,
                              text1: 'Experience: ',
                              text2: vacancy.experience,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            _DescriptonField(
                              icon: Icons.library_books_rounded,
                              text1: 'Qualification: ',
                              text2: vacancy.qualification,
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
                              height: 8,
                            ),
                            _DescriptonField(
                              icon: Icons.sunny,
                              text1: 'Shift Time: ',
                              text2: vacancy.timing,
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
                        height: MediaQuery.sizeOf(context).width,
                        width: MediaQuery.sizeOf(context).width,
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
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
                              vacancy.jobDescription,
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
          if(!hasApplied)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.screenPadding,
                vertical: context.screenPadding,
              ),
              child: Consumer<ApplyProvider>(
                builder: (context, provider, _) {
                  return PrimaryButton(
                    btncolor: Colors.black,
                    txtcolor: Colors.white,
                    text: 'Apply',
                    isLoading: provider.isBusy,
                    onTap: () => provider.isBusy ? null : _apply( context ),
                  );
                }
              ),
            ),
          ),
        ],
      ),
    );
  }
  @override
  Widget wrappedRoute(BuildContext context) => ChangeNotifierProvider(
    create: (context) => locator<ApplyProvider>(),
    child: this,
  );

  Future<void> _apply(BuildContext context) async {
    await context.read<ApplyProvider>().apply(
      id: vacancy.id,
      sId: vacancy.shops.id,
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
