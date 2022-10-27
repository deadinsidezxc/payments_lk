import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reforce_platform/app/auth/screen/phone_screen.dart';

import 'app/payments/local_storage/local_storage.dart';
import 'app/tabbar/tabbar.dart';
import 'common/static/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: false,
      designSize: const Size(360, 800),
      builder: ((context, child) {
        return ProviderScope(
          child: MaterialApp(
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
              primarySwatch: AppColors.CUSTOMRED,
              appBarTheme: AppBarTheme(color: Colors.white, foregroundColor: AppColors.darkGrey),
            ),
            initialRoute: '/tab_view',
            routes: {
              '/authentication': (context) => PhoneAuthScreen(),
              '/tab_view': (context) => TabView(),
            },
          ),
        );
      }),
    );
  }
}
