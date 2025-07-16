import 'package:autoapi_example_flutter/pages/user.dart';
import 'package:autoapi_example_flutter/utils/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AutoAPI 示例',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'SourceSansPro',
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF004099)),
        scaffoldBackgroundColor: Color.fromRGBO(245, 245, 245, 1),
        appBarTheme: AppBarTheme(shadowColor: Colors.grey[100], elevation: 2),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          },
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Colors.white,
        ),
      ),
      home: const UserPage(),
      // 本地化代理
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FallbackCupertinoLocalisationsDelegate()
      ],
      locale: const Locale('zh', 'CN'),
      supportedLocales: const [
        Locale('en', 'US'), // 英语
        Locale('zh', 'CN'), // 中文
      ],
    );
  }
}
