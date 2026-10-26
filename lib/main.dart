import 'package:core/l10n/core_l10n.dart';
import 'package:core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:prj2/app_bootstrap.dart';
import 'package:prj2/widget/ETH/eth_screen.dart';
import 'package:prj2/widget/home/home_screen.dart';
import 'package:prj2/widget/statistic/statistic_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeAppServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.locale});

  final Locale? locale;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: appNavigatorKey,
      locale: locale,
      localizationsDelegates: CoreLocalizations.localizationsDelegates,
      supportedLocales: CoreLocalizations.supportedLocales,
      theme: AppTheme.dark,
      home: const HomeScreen(),
    );
  }
}
