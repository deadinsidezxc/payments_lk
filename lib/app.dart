import 'package:flutter/material.dart';
import 'package:rick_and_morty_api/presentation/pages/contracts_main_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/dictionaries/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: false,
      designSize: const Size(360, 800),
      builder: (context, child) {
        return MaterialApp(
          title: 'Варяг',
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('ru'),
          ],
          theme: ThemeData(
            primarySwatch: AppConstants.CUSTOMRED,
            appBarTheme: AppBarTheme(color: Colors.white),
          ),
          home: PaymentsMainPage(),
        );
      }
    );
  }
}