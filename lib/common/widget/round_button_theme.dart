import 'package:military1km/common/common.dart';
import 'package:flutter/material.dart';

enum RoundButtonTheme {
  green(AppColors.green, Colors.black, AppColors.green,
      backgroundColorProvider: blueColorProvider),
  whiteWithBlueBorder(Colors.white, AppColors.darkBlue, AppColors.blue,
      backgroundColorProvider: blueColorProvider),
  blink(AppColors.blue, Color.fromARGB(255, 134, 98, 98), Colors.black,
      backgroundColorProvider: blueColorProvider);

  const RoundButtonTheme(
    this.bgColor,
    this.textColor,
    this.borderColor, {
    this.backgroundColorProvider,
  }) : shadowColor = Colors.transparent;

  ///RoundButtonTheme 안에서 Custome Theme 분기가 필요하다면 이렇게 함수로 사용
  final Color Function(BuildContext context)? backgroundColorProvider;
  final Color bgColor;
  final Color textColor;
  final Color borderColor;
  final Color shadowColor;
}

Color blueColorProvider(BuildContext context) =>
    context.appColors.blueButtonBackground;

Color Function(BuildContext context) defaultColorProvider(Color color) =>
    blueColorProvider;
