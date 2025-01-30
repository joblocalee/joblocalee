import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../widgets/buttons/ink_well_material.dart';
import '../../../core/routes/app_router.gr.dart';
import '../../../utils/constants/app_dimensions.dart';
import '../../../utils/constants/app_images.dart';
import '../../../utils/extensions/build_context_extension.dart';
import '../../../utils/constants/app_typography.dart';
import '../../widgets/buttons/primary_button.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final ValueNotifier<int?> _selectedCategory;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.screenPadding,
              vertical: context.screenPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15.0),
                      border: InputBorder.none,
                      hintText: 'Search...',
                      prefixIcon: Icon(
                        Icons.search_rounded,
                      ),
                    ),
                  ),
                ),
                Gap(AppDimensions.gapLarge),
                ValueListenableBuilder(
                  valueListenable: _selectedCategory,
                  builder: (context, categoryId, child) => SizedBox(
                    height: 40,
                    child: ListView.builder(
                      itemCount: 7,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => _Category(
                        onTap: () => _selectCategory(index),
                        isSelected: index == categoryId,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: 20,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => _JobCard(
                      onTap: () {
                        context.router.push(JobDescriptionRoute());
                      },
                    ),
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

  void _selectCategory(int index) =>
      _selectedCategory.value = _selectedCategory.value == index ? null : index;
}

class _Category extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const _Category({
    required this.onTap,
    super.key,
    this.isSelected = false,
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
          height: 50,
          width: 100,
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

  const _JobCard({
    super.key,
    required this.onTap,
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
