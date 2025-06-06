import 'package:aloroupia/core/manager/cache/cache_helper.dart';
import 'package:aloroupia/core/manager/services/service_locator.dart';
import 'package:aloroupia/core/router/app_router.dart';
import 'package:aloroupia/core/router/router_function.dart';
import 'package:aloroupia/generated/l10n.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup_Service_Locator();
  await getIt<CacheHelper>().init();
  runApp(DevicePreview(enabled: true, builder: (context) => Aloroupia()));
}

class Aloroupia extends StatelessWidget {
  const Aloroupia({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      builder: DevicePreview.appBuilder,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      // theme: ThemeData(fontFamily: 'Garamond'),
      locale: const Locale('en'),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: AppRouter.splashView,
    );
  }
}
