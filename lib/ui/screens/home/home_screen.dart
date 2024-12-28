import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../utils/constants/app_images.dart';
import '../../../utils/constants/app_dimensions.dart';
import '../../../utils/constants/app_typography.dart';
import '../../../utils/extensions/build_context_extension.dart';
import '../../widgets/buttons/ink_well_material.dart';
import '../../widgets/buttons/primary_button.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.screenPadding * 0.5,
            ),
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
                  child: ValueListenableBuilder(
                    valueListenable: _selectedCategory,
                    builder: (context, categoryId, child) => ListView.builder(
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
                    itemBuilder: (context, index) => _JobCard(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _selectCategory(int index) => _selectedCategory.value = _selectedCategory.value == index ? null : index;
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
        borderRadius: 45,
        onTap: onTap,
        child: Container(
          alignment: Alignment(0, 0),
          height: 50,
          width: 100,
          decoration: BoxDecoration(
            color: isSelected ? Colors.black: Colors.white,
            border: Border.all(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(45),
          ),
          child: Text(
            'Recent',
            style: AppTypography.labelLarge.copyWith(
              color: isSelected ? Colors.white: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class _JobCard extends StatelessWidget {

  const _JobCard({super.key});

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
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 10,
                  offset: Offset(-5, 5),
                ),
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
                        AppImages.splashImage,
                        fit: BoxFit.fill,
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
