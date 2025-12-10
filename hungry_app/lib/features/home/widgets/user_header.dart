import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/l10n/app_localizations.dart';
import 'package:hungry_app/provider/locale_provider.dart';
import 'package:hungry_app/shared/costum_text.dart';
import 'package:hungry_app/theme_provider/theme_provider.dart';
import 'package:provider/provider.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);
    final localeProvider = Provider.of<LocaleProvider>(context);
    final t = context.l10n;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              "assets/logo/logo.svg",
              color: AppColors.primary,
              height: 35,
            ),
            const Gap(5),
            CostumText(
              text: t.translate('hello_user'),
              color: AppColors.search,
              size: 16,
            ),
          ],
        ),
        // CircleAvatar(
        //   radius: 25,
        //   backgroundColor: AppColors.primary,
        //   child: const Icon(Icons.person, color: Colors.white),
        // ),
        Row(
          children: [
            IconButton(
              onPressed: () => localeProvider.setLocale(
                  localeProvider.locale.languageCode == 'en' ? 'ar' : 'en'),
              icon: const Icon(Icons.translate),
              tooltip: t.translate('language'),
            ),
            IconButton(
              onPressed: provider.toggleTheme,
              icon: const Icon(Icons.sunny),
              tooltip: t.translate('dark_mode'),
            ),
          ],
        ),
      ],
    );
  }
}
