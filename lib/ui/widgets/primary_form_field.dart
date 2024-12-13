import 'package:flutter/material.dart';

import '../../utils/constants/app_typography.dart';

class PrimaryFormField extends StatefulWidget {
  final String? hText;
  final String lText;
  final Widget? prefix;
  final bool isPassWord;

  const PrimaryFormField({
    super.key,
    this.hText,
    required this.lText,
    this.prefix,
    this.isPassWord = false,
  });

  @override
  State<PrimaryFormField> createState() => _PrimaryFormFieldState();
}

class _PrimaryFormFieldState extends State<PrimaryFormField> {
  bool _isSecure = false;

  @override
  void initState() {
    super.initState();
    _isSecure = widget.isPassWord;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          obscureText: _isSecure,
          style: TextStyle(
            fontFamily: AppTypography.defaultFamily,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            labelStyle: AppTypography.labelMedium,
            hintText: widget.hText,
            labelText: widget.lText,
            prefixIcon: widget.prefix,
            suffixIcon: widget.isPassWord
                ? IconButton(
                    onPressed: () => setState(() => _isSecure = !_isSecure),
                    icon: Icon(
                      _isSecure ? Icons.visibility : Icons.visibility_off,
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
