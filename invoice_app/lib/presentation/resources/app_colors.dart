// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:invoice_app/config/color_config.dart';

class AppColors {
  final Color textPrimary;
  final Color textSecondary;

  AppColors({
    required this.textPrimary,
    required this.textSecondary,
  });
}

final colorsDark = AppColors(
  textPrimary: DarkColors.textPrimary,
  textSecondary: DarkColors.textSecondary,
);

extension AppColorsExtension on BuildContext {
  AppColors get colors => colorsDark;
}
