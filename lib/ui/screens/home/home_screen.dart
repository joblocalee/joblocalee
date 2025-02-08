import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/provider/home_provider.dart';
import '../../../core/model/vacancy/vacancy_model.dart';
import '../../../core/model/category/category_model.dart';
import '../../../core/injection/injection.dart';
import '../../../core/routes/app_router.gr.dart';
import '../../../utils/constants/app_images.dart';
import '../../../utils/constants/app_typography.dart';
import '../../../utils/extensions/build_context_extension.dart';
import '../../widgets/buttons/ink_well_material.dart';
import '../../widgets/buttons/primary_button.dart';

@RoutePage()
class HomeScreen extends StatefulWidget implements AutoRouteWrapper {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  @override
  Widget wrappedRoute(BuildContext context) => ChangeNotifierProvider(
    create: (context) => locator<HomeProvider>(),
    child: this,
  );
}

class _HomeScreenState extends State<HomeScreen> {
  late final ValueNotifier<CategoryModel?> _selectedCategory;

  @override
  void initState() {
    super.initState();
    _selectedCategory = ValueNotifier(null);
  }

  @override
  void dispose() {
    _selectedCategory.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: Padding(
          padding: EdgeInsets.only(
            left: 10.0,
            right: 10.0,
          ),
          child: Text(
            'New Openings',
            style: AppTypography.titleLarge,
          ),
        ),
      ),
      body: SafeArea(
        child: Consumer<HomeProvider>(
          builder: (context, provider, _) => SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.screenPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 35,
                    child: ValueListenableBuilder(
                      valueListenable: _selectedCategory,
                      builder: (context, categoryId, child) => ListView.builder(
                        itemCount: provider.categories.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => _Category(
                          onTap: () =>
                              _selectCategory(provider.categories[index]),
                          isSelected: index == categoryId,
                          category: provider.categories[index],
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: provider.vacancies.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => _JobCard(
                      onTap: () => context.router.push(JobDescriptionRoute()),
                      vacancy: provider.vacancies[index],
                    ),
                  ),
                  Gap(MediaQuery.paddingOf(context).bottom + 100),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _selectCategory(CategoryModel category) => _selectedCategory.value =
      _selectedCategory.value == category ? null : category;
}

class _Category extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final CategoryModel category;

  const _Category({
    super.key,
    required this.onTap,
    this.isSelected = false,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4, left: 4),
      child: InkWellMaterial(
        borderRadius: 16.0,
        onTap: onTap,
        child: Container(
          alignment: Alignment(0, 0),
          height: 35,
          width: 90,
          decoration: BoxDecoration(
            color: isSelected ? Colors.black : Colors.white,
            border: Border.all(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Text(
            'Recent',
            style: AppTypography.labelLarge.copyWith(
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class _JobCard extends StatelessWidget {
  final VoidCallback onTap;
  final VacancyModel vacancy;

  const _JobCard({
    super.key,
    required this.onTap,
    required this.vacancy,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 16.0,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    AppImages.splashImage,
                    fit: BoxFit.fill,
                    height: 175,
                  ),
                ),
                const Gap(10),
                Expanded(
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
                      const Spacer(),
                      PrimaryButton(
                        onTap: () {},
                        text: 'Apply',
                      ),
                    ],
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
