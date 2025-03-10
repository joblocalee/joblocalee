import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/injection/injection.dart';
import '../../../core/provider/vacancy_provider.dart';
import '../../../core/model/vacancy/vacancy_model.dart';
import '../../../core/routes/app_router.gr.dart';
import '../../../utils/constants/app_images.dart';
import '../../../utils/extensions/build_context_extension.dart';
import '../../../utils/constants/app_typography.dart';
import '../../widgets/buttons/ink_well_material.dart';
import '../../widgets/buttons/primary_button.dart';

@RoutePage()
class AppliedJobsScreen extends StatelessWidget implements AutoRouteWrapper{
  const AppliedJobsScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) => ChangeNotifierProvider(
    create: (context) => locator<VacancyProvider>()..getVacancy(),
    child: this,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Text(
          'Applied Jobs',
          style: AppTypography.titleLarge,
        ),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            context.router.maybePop();
          },
        ),
      ),
      body: SafeArea(
        child: Consumer<VacancyProvider>(
          builder: (context, provider, _) {
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.screenPadding,
                  vertical: context.screenPadding
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: provider.vacancies.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => _JobCard(
                        onTap: () => context.router.push(JobDescriptionRoute(
                            vacancy: provider.vacancies[index])),
                        vacancy: provider.vacancies[index],
                      ).wrappedRoute(context),
                    ),
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}

class _JobCard extends StatelessWidget implements AutoRouteWrapper {
  final VoidCallback onTap;
  final VacancyModel vacancy;

  const _JobCard({
    required this.onTap,
    required this.vacancy,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 16.0,
      ),
      child: Container(
        height: 175,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWellMaterial(
                borderRadius: 20,
                onTap: onTap,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    AppImages.splashImage,
                    fit: BoxFit.fill,
                    height: 175,
                  ),
                ),
              ),
              const Gap(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: InkWellMaterial(
                        borderRadius: 20,
                        onTap: onTap,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              vacancy.title,
                              style: AppTypography.titleLarge,
                            ),
                            Text(
                              vacancy.salary,
                              style: AppTypography.bodyMedium.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              vacancy.timing,
                              style: AppTypography.bodyMedium.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                    Consumer<ApplyProvider>(builder: (context, provider, _) {
                      return PrimaryButton(
                        btncolor: Colors.black,
                        txtcolor: Colors.white,
                        isLoading: provider.isBusy,
                        onTap: () => provider.isBusy ? null : _apply(context),
                        text: 'Apply',
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
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