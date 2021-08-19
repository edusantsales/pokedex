import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app.dart';

class AppTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Modular.initialRoute,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.primary,
        accentColor: AppColors.accent,
        backgroundColor: AppColors.white,
        cardColor: AppColors.white,
        errorColor: AppColors.error,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      supportedLocales: [const Locale('pt', 'BR')],
    ).modular();
  }
}
