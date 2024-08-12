import 'package:military1km/common/constant/app_colors.dart';
import 'package:flutter/material.dart';

export 'package:military1km/common/constant/app_colors.dart';

typedef ColorProvider = Color Function();

abstract class AbstractThemeColors {
  const AbstractThemeColors();

  Color get seedColor => const Color.fromARGB(255, 255, 255, 255);

  Color get seedBgColor => const Color(0xFFC2FF49);

  Color get seedButtonColor => const Color(0xFF2E8EFF);

  Color get seedTextColor => const Color.fromARGB(255, 255, 255, 255);

  Color get veryBrightGrey => AppColors.brightGrey;

  Color get drawerBg => const Color.fromARGB(255, 255, 255, 255);

  Color get scrollableItem => const Color.fromARGB(255, 57, 57, 57);

  Color get iconButton => const Color(0xFFF1E1B8);

  Color get iconButtonInactivate => const Color.fromARGB(255, 81, 84, 93);

  Color get inActivate => const Color.fromARGB(255, 200, 207, 220);

  Color get activate => const Color.fromARGB(255, 63, 72, 95);

  Color get badgeBg => AppColors.blueGreen;

  Color get textBadgeText => Colors.white;

  Color get badgeBorder => Colors.transparent;

  Color get divider => const Color.fromARGB(255, 165, 164, 164);

  Color get secondColor => const Color(0xFFF1E1B8);

  Color get hintText => AppColors.middleGrey;

  Color get focusedBorder => AppColors.darkGrey;

  Color get confirmText => AppColors.blue;

  Color get drawerText => secondColor;

  Color get snackbarBgColor => AppColors.mediumBlue;

  Color get blueButtonBackground => AppColors.darkBlue;

  Color get lessImportant => const Color.fromARGB(255, 158, 158, 158);
}
