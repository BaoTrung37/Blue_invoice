// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:invoice_app/config/color_config.dart';

class AppColors {
  final Color textPrimary;
  final Color textSecondary;
  final Color action;
  final Color backgroundPrimary;
  final Color backgroundSecondary;
  final Color lightBackground;
  final Color button1Color;
  final Color hoverButton1Color;
  final Color button2Color;
  final Color hoverButton2Color;
  final Color button3Color;
  final Color hoverButton3Color;
  final Color button4Color;
  final Color hoverButton4Color;
  final Color button5Color;
  final Color hoverButton5Color;
  final Color button6Color;
  final Color hoverButton6Color;

  AppColors({
    required this.textPrimary,
    required this.textSecondary,
    required this.action,
    required this.backgroundPrimary,
    required this.backgroundSecondary,
    required this.lightBackground,
    required this.button1Color,
    required this.hoverButton1Color,
    required this.button2Color,
    required this.hoverButton2Color,
    required this.button3Color,
    required this.hoverButton3Color,
    required this.button4Color,
    required this.hoverButton4Color,
    required this.button5Color,
    required this.hoverButton5Color,
    required this.button6Color,
    required this.hoverButton6Color,
  });
}

final colorsDark = AppColors(
  textPrimary: DarkColors.textPrimary,
  textSecondary: DarkColors.textSecondary,
  action: DarkColors.action,
  backgroundPrimary: DarkColors.backgroundPrimary,
  backgroundSecondary: DarkColors.backgroundSecondary,
  lightBackground: DarkColors.lightBackground,
  button1Color: DarkColors.button1Color,
  hoverButton1Color: DarkColors.hoverButton1Color,
  button2Color: DarkColors.button2Color,
  hoverButton2Color: DarkColors.hoverButton2Color,
  button3Color: DarkColors.button3Color,
  hoverButton3Color: DarkColors.hoverButton3Color,
  button4Color: DarkColors.button4Color,
  hoverButton4Color: DarkColors.hoverButton4Color,
  button5Color: DarkColors.button5Color,
  hoverButton5Color: DarkColors.hoverButton5Color,
  button6Color: DarkColors.button6Color,
  hoverButton6Color: DarkColors.hoverButton6Color,
);

extension AppColorsExtension on BuildContext {
  AppColors get colors => colorsDark;
}
