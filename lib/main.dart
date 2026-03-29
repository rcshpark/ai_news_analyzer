import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stock_pilot/l10n/app_localizations.dart';
import 'package:stock_pilot/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const appEnv = String.fromEnvironment('APP_ENV', defaultValue: 'production');

  if (appEnv == 'production') {
    await dotenv.load(fileName: 'env/.env.prod');
  } else {
    await dotenv.load(fileName: 'env/.env.dev');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.create(),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      supportedLocales: const [Locale('ko', ''), Locale('en', '')],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}
