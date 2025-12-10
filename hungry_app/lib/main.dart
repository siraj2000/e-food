import 'package:flutter/material.dart';
import 'package:hungry_app/provider/locale_provider.dart';
import 'package:hungry_app/root.dart';
import 'package:hungry_app/theme_provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
      ],
      child: Builder(
        builder: (context) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          final localeProvider = Provider.of<LocaleProvider>(context);

          return MaterialApp(
            locale: localeProvider.locale, // ← اللغة
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.delegates,
            theme: themeProvider.theme,
            home: const Root(),
          );
        },
      ),
    );
  }
}
