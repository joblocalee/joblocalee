import 'package:flutter/material.dart';

import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_typography.dart';

class ProfileTextField extends StatefulWidget {
  ProfileTextField({
    super.key,
    this.initVal,
    required this.lbel,
    required this.passHide,
    this.child,
    // this.onTap,
  });

  Widget? child;
  String? initVal;
  final String lbel;
  bool passHide = true;
  bool readOnly = false;
  // VoidCallback onTap;

  @override
  State<ProfileTextField> createState() => _ProfileTextFieldState();
}

class _ProfileTextFieldState extends State<ProfileTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTypography.labelLarge,
      initialValue: widget.initVal,
      obscureText: widget.passHide,
      decoration: InputDecoration(
        label: Text(
          widget.lbel,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
        ),
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.buttonColor)),
      ),
    );
  }
}
