import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../utils/constants/app_typography.dart';
import '../../../utils/extensions/build_context_extension.dart';

@RoutePage()
class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(16),
            Icon(
              Icons.account_circle_rounded,
              size: 75,
              color: Colors.white,
            ),
            Text(
              'Muhammed Nihal M P',
              style: AppTypography.bodyLarge.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _DescriptonField(
                  icon: Icons.alternate_email_rounded,
                  text1: 'muhammednihal@joblocalee.com',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _DescriptonField(
                  icon: Icons.phone,
                  text1: '+91 75109 21254',
                ),
              ],
            ),
            Gap(32),
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)
                ),
                color: Colors.white,
              ),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height,
                width: double.infinity,
              ),
            )
          ],
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
          color: Colors.white,
        ),
        SizedBox(
          width: 2,
        ),
        Text(
          text1,
          style: AppTypography.bodyLarge.copyWith(
            fontSize: 16,
            color: Colors.white,
          ),
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
