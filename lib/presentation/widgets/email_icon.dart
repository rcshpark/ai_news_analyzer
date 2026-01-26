import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ai_news_analyzer/core/const/app_icons_const.dart';

class EmailIcon extends StatelessWidget {
  const EmailIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppIcons.emailIcon,
      width: 20,
      height: 20,
      fit: BoxFit.contain,
    );
  }
}
