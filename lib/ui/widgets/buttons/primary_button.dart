import 'package:flutter/material.dart';
import 'package:jus/utils/constants/app_typography.dart';

class PrimaryButton extends StatelessWidget {
  final String? text;
  final VoidCallback onTap;

  const PrimaryButton({super.key, this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          text!,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        height: 50,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
