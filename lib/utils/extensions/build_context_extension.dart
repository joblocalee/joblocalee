// Path:- lib\utils\extensions\build_context_extension.dart

import 'package:flutter/material.dart';

extension SafePaddingExtension on BuildContext {
  double get safeBottom => MediaQuery.paddingOf(this).bottom + 100;

  double get safeBottomStrict => MediaQuery.paddingOf(this).bottom;

  double get safeTopStrict => MediaQuery.paddingOf(this).top;

  double get screenPadding =>
      (MediaQuery.sizeOf(this).width * 0.05).clamp(16, 24);

  double get bottomInset => MediaQuery.viewInsetsOf(this).bottom;

  double get height => MediaQuery.sizeOf(this).height;
}