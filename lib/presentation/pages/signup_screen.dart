import 'package:ai_news_analyzer/core/const/app_color_const.dart';
import 'package:ai_news_analyzer/core/const/app_text_style_const.dart';
import 'package:ai_news_analyzer/presentation/widgets/email_icon.dart';
import 'package:ai_news_analyzer/presentation/widgets/github_icon.dart';
import 'package:ai_news_analyzer/presentation/widgets/google_icon.dart';
import 'package:ai_news_analyzer/presentation/widgets/lock_icon.dart';
import 'package:ai_news_analyzer/presentation/widgets/user_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.signUp,
          style: const TextStyle(color: AppColors.white),
        ),
        backgroundColor: AppColors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
      body: Container(
        color: AppColors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
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
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 12),
                              Column(
                                children: [
                                  _buildSocialLoginButton(
                                    context,
                                    AppLocalizations.of(
                                      context,
                                    )!.continueWithGoogle,
                                    const GoogleIcon(),
                                  ),
                                  const SizedBox(height: 12),
                                  _buildSocialLoginButton(
                                    context,
                                    AppLocalizations.of(
                                      context,
                                    )!.continueWithGithub,
                                    const GithubIcon(),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 48),
                              _buildDividerWithText(
                                AppLocalizations.of(context)!.signUpWithEmail,
                              ),
                              const SizedBox(height: 16),
                              Column(
                                children: [
                                  _buildTextInputField(
                                    context,
                                    AppLocalizations.of(context)!.name,
                                    const UserIcon(),
                                  ),
                                  const SizedBox(height: 15.994),
                                  _buildTextInputField(
                                    context,
                                    AppLocalizations.of(context)!.email,
                                    const EmailIcon(),
                                  ),
                                  const SizedBox(height: 15.994),
                                  _buildTextInputField(
                                    context,
                                    AppLocalizations.of(context)!.password,
                                    const LockIcon(),
                                    obscureText: true,
                                  ),
                                  const SizedBox(height: 15.994),
                                  _buildTextInputField(
                                    context,
                                    AppLocalizations.of(
                                      context,
                                    )!.confirmPassword,
                                    const LockIcon(),
                                    obscureText: true,
                                  ),
                                  const SizedBox(height: 15.994),
                                  _buildTermsAndConditions(context),
                                  const SizedBox(height: 15.994),
                                  _buildSignUpButton(context),
                                ],
                              ),
                              const SizedBox(height: 24.001),
                              _buildLoginPrompt(context),
                              const SizedBox(height: 24.001),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialLoginButton(
    BuildContext context,
    String text,
    Widget icon,
  ) {
    return Container(
      height: 53.348,
      decoration: BoxDecoration(
        color: AppColors.darkBackground2_60,
        border: Border.all(color: AppColors.borderColor, width: 0.676),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 11.99),
            Text(text, style: AppTextStyles.socialButtonText),
          ],
        ),
      ),
    );
  }

  Widget _buildDividerWithText(String text) {
    return Row(
      children: [
        const Expanded(
          child: Divider(color: AppColors.borderColor, thickness: 0.676),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11.99),
          child: Text(text, style: AppTextStyles.dividerText),
        ),
        const Expanded(
          child: Divider(color: AppColors.borderColor, thickness: 0.676),
        ),
      ],
    );
  }

  Widget _buildTextInputField(
    BuildContext context,
    String hintText,
    Widget icon, {
    bool obscureText = false,
  }) {
    return Container(
      height: 53.338,
      decoration: BoxDecoration(
        color: AppColors.darkBackground2_60, // rgba(24,24,27,0.6)
        border: Border.all(color: AppColors.borderColor, width: 0.676),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.only(
        left: 15.99,
        right: 16,
      ), // Adjusted left padding to align icon
      child: Row(
        children: [
          icon,
          const SizedBox(
            width: 11.99,
          ), // Add some spacing between icon and text field
          Expanded(
            child: TextFormField(
              obscureText: obscureText,
              style: AppTextStyles.textInputField,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: AppTextStyles.hintText,
                border: InputBorder.none, // Remove default border
                contentPadding: EdgeInsets.zero, // Remove default padding
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTermsAndConditions(BuildContext context) {
    bool isChecked = false;
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: isChecked,
            onChanged: (bool? newValue) {},
            fillColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return AppColors.darkBackground2_60;
              }
              return AppColors.darkBackground2_60;
            }),
            side: const BorderSide(color: AppColors.borderColor, width: 0.676),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Wrap(
            children: [
              Text(
                AppLocalizations.of(context)!.agreeTo,
                style: AppTextStyles.termsAndConditionsText,
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  AppLocalizations.of(context)!.termsAndConditions,
                  style: AppTextStyles.termsAndConditionsLink,
                ),
              ),
              Text(
                AppLocalizations.of(context)!.and,
                style: AppTextStyles.termsAndConditionsText,
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  AppLocalizations.of(context)!.privacyPolicy,
                  style: AppTextStyles.termsAndConditionsLink,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return Container(
      height: 51.996,
      decoration: BoxDecoration(
        color: AppColors.buttonBlue,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: AppColors.blueShadow,
            offset: Offset(0, 10),
            blurRadius: 15,
            spreadRadius: -3,
          ),
          BoxShadow(
            color: AppColors.blueShadow,
            offset: Offset(0, 4),
            blurRadius: 6,
            spreadRadius: -4,
          ),
        ],
      ),
      child: Center(
        child: Text(
          AppLocalizations.of(context)!.signUpButton,
          style: AppTextStyles.socialButtonText,
        ),
      ),
    );
  }

  Widget _buildLoginPrompt(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.alreadyHaveAccount,
          style: AppTextStyles.loginPromptText,
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            AppLocalizations.of(context)!.login,
            style: AppTextStyles.loginPromptLink,
          ),
        ),
      ],
    );
  }
}
