import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../utils/extensions/build_context_extension.dart';
import '../../../utils/constants/app_typography.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.screenPadding,
        vertical: context.screenPadding,
      ),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
                child: Text(
                  'Featured Openings',
                  style: AppTypography.headlineLarge.copyWith(
                    fontSize: 35,
                  ),
                ),
              ),
              TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(45)
                  ),
                  hintText: 'Search...',
                  prefixIcon: const Icon(Icons.search_rounded)
                ),
              ),
              Gap(10),
              // SizedBox(
              //   height: 60,
              //   child: Text(
              //     'Featured Openings',
              //     style: AppTypography.headlineLarge.copyWith(
              //       fontSize: 35,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
