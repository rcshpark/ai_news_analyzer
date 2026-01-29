import 'package:ai_news_analyzer/core/const/app_color_const.dart';
import 'package:ai_news_analyzer/core/const/app_text_style_const.dart';
import 'package:ai_news_analyzer/presentation/widgets/email_icon.dart';
import 'package:ai_news_analyzer/presentation/widgets/lock_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.darkBackground1,
              AppColors.darkBackground2,
              AppColors.darkBackground1,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 80),
            Text(
              AppLocalizations.of(context)!.introTitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.introTitle,
            ),
            Text(
              AppLocalizations.of(context)!.introSubTitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.introSubtitle,
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.email,
                  hintStyle: AppTextStyles.greyText,
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: EmailIcon(),
                  ),
                  filled: true,
                  fillColor: AppColors.darkBackground2_60,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: AppColors.borderColor,
                      width: 0.5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: AppColors.borderColor,
                      width: 0.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: AppColors.borderColor,
                      width: 0.5,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.password,
                  hintStyle: AppTextStyles.greyText,
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: LockIcon(),
                  ),
                  filled: true,
                  fillColor: AppColors.darkBackground2_60,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: AppColors.borderColor,
                      width: 0.5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: AppColors.borderColor,
                      width: 0.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: AppColors.borderColor,
                      width: 0.5,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Login Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.loginButtonBackground,
                  minimumSize: const Size(double.infinity, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  shadowColor: AppColors.blueShadow,
                  elevation: 10,
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.flash_on, color: AppColors.white),
                    const SizedBox(width: 8),
                    Text(
                      AppLocalizations.of(context)!.loginToStart,
                      style: AppTextStyles.loginButtonText,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Divider
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                  child: Divider(
                    color: AppColors.borderColor,
                    indent: 24,
                    endIndent: 10,
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.or,
                  style: AppTextStyles.greyText,
                ),
                const Expanded(
                  child: Divider(
                    color: AppColors.borderColor,
                    indent: 10,
                    endIndent: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Guest Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 52),
                  side: const BorderSide(
                    color: AppColors.borderColor,
                    width: 0.5,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.guestToStart,
                      style: AppTextStyles.guestButtonText,
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.arrow_forward,
                      color: AppColors.guestButtonText,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Sign up
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.noAccount,
                  style: AppTextStyles.greyText,
                ),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push('/signup');
                  },
                  child: Text(
                    AppLocalizations.of(context)!.signUp,
                    style: AppTextStyles.accentBlueText,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
