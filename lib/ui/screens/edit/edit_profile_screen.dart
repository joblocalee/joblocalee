import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../utils/extensions/build_context_extension.dart';
import '../../../utils/constants/app_images.dart';
import '../../../utils/constants/app_dimensions.dart';
import '../../../utils/constants/app_typography.dart';
import '../../widgets/buttons/ink_well_material.dart';
import '../../widgets/buttons/operation_button.dart';
import '../../widgets/profile_text_field.dart';

@RoutePage()
class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  List<String> _genderList = ["Select Gender","Male", "Female"];
  String _selectedGender = "Select Gender";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.screenPadding * 0.75,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(10),
              Align(
                alignment: Alignment.center,
                child: ClipOval(
                  child: Image.asset(
                    AppImages.profileImage2,
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Gap(AppDimensions.gapXXL),
              ProfileTextField(
                lbel: 'Name',
                initVal: "Muhammed Shamil",
                passHide: false,
              ),
              Gap(AppDimensions.gapXXL),
              ProfileTextField(
                lbel: 'Email',
                initVal: "muhammedshamil@joblocalee.com",
                passHide: false,
              ),
              Gap(AppDimensions.gapXXL),
              ProfileTextField(
                lbel: 'Phone',
                initVal: "+91 9876543210",
                passHide: false,
              ),
              Gap(AppDimensions.gapXXL),
              ProfileTextField(
                lbel: 'DOB',
                initVal: "01/01/2001",
                passHide: false,
              ),
              Gap(AppDimensions.gapXXL),

              Gap(AppDimensions.gapRegular),
              Gap(AppDimensions.gapXXL),
              InkWellMaterial(
                onTap: () {},
                child: OperationButton(
                  btnTxt: "Update profile",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class _DescriptonField extends StatelessWidget {
  final IconData icon;
  final String text1;
  final String? text2;

  const _DescriptonField({
    super.key,
    required this.icon,
    required this.text1,
    this.text2
  });

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
