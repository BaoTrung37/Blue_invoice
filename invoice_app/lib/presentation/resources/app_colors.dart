// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:invoice_app/config/color_config.dart';

class AppColors {
  final Color textPrimary;
  final Color textSecondary;
  final Color action;
  final Color backgroundPrimary;
  final Color backgroundSecondary;

  AppColors({
    required this.textPrimary,
    required this.textSecondary,
    required this.action,
    required this.backgroundPrimary,
    required this.backgroundSecondary,
  });
}

final colorsDark = AppColors(
  textPrimary: DarkColors.textPrimary,
  textSecondary: DarkColors.textSecondary,
  action: DarkColors.action,
  backgroundPrimary: DarkColors.backgroundPrimary,
  backgroundSecondary: DarkColors.backgroundSecondary,
);

extension AppColorsExtension on BuildContext {
  AppColors get colors => colorsDark;
}
