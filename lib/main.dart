import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:uia/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ru', null);

  runApp(const Uia());
}

class Uia extends StatelessWidget {
  const Uia({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uia',

      theme: ThemeData(
        splashFactory: NoSplash.splashFactory,
      ),


      routes: AppRoutes.routes,
      initialRoute: AppRoutes.onboardingScreeen,
    );
  }
}