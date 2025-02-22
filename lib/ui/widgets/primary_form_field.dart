import 'package:flutter/material.dart';

import '../../utils/constants/app_typography.dart';

class PrimaryFormField extends StatefulWidget {
  final String? hText;
  final String? initialText;
  final String lText;
  final Widget? prefix;
  final bool isPassWord;
  final int? minLines;
  final int? maxLines;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const PrimaryFormField({
    super.key,
    this.hText,
    required this.lText,
    this.prefix,
    this.isPassWord = false,
    this.controller,
    this.validator,
    this.minLines,
    this.maxLines,
    this.initialText,
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
    if (widget.controller != null && widget.initialText != null) {
      widget.controller!.text = widget.initialText!;
    }

  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _isSecure,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      initialValue: widget.controller != null ? null : widget.initialText,
      style: const TextStyle(fontFamily: AppTypography.defaultFamily),
      validator: widget.validator,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
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
    );
  }
}
