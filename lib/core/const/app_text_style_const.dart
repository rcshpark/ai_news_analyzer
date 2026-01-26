import 'package:ai_news_analyzer/core/const/app_color_const.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle introTitle = TextStyle(
    color: AppColors.white,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle introSubtitle = TextStyle(
    color: AppColors.greyText2,
    fontSize: 14,
  );

  static const TextStyle loginButtonText = TextStyle(
    color: AppColors.white,
    fontSize: 16,
  );

  static const TextStyle greyText = TextStyle(color: AppColors.greyText1);

  static const TextStyle guestButtonText = TextStyle(
    color: AppColors.guestButtonText,
    fontSize: 16,
  );

  static const TextStyle accentBlueText = TextStyle(
    color: AppColors.accentBlue,
  );

  static const TextStyle socialButtonText = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    fontSize: 16,
    height: 24 / 16,
    color: AppColors.white,
    letterSpacing: -0.3125,
  );

  static const TextStyle dividerText = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.normal,
    fontSize: 12,
    height: 16 / 12,
    color: AppColors.greyText1,
  );

  static const TextStyle textInputField = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    color: AppColors.white,
    letterSpacing: -0.3125,
  );

  static const TextStyle hintText = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.normal,
    fontSize: 16,
    color: AppColors.greyText1,
    letterSpacing: -0.3125,
  );

  static const TextStyle termsAndConditionsLink = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 20 / 14,
    color: AppColors.accentBlue,
    letterSpacing: -0.1504,
  );

  static const TextStyle termsAndConditionsText = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 20 / 14,
    color: AppColors.greyText2,
    letterSpacing: -0.1504,
  );

  static const TextStyle loginPromptText = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.normal,
    fontSize: 14,
    height: 20 / 14,
    color: AppColors.greyText1,
    letterSpacing: -0.1504,
  );

  static const TextStyle loginPromptLink = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    fontSize: 16,
    height: 24 / 16,
    color: AppColors.accentBlue,
    letterSpacing: -0.3125,
  );
  static const TextStyle appBarTitle = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    fontSize: 20,
    height: 28 / 20,
    color: AppColors.white,
    letterSpacing: -0.4492,
  );
}
