import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ktc/home_page/s_home_screen.dart';

import 'constants/k_colors.dart';
import 'constants/k_firebase_options.dart';
import 'database/database_helper.dart';
import 'navigation/k_routes.dart';
import 'navigation/route_config.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() async {
  setUrlStrategy(PathUrlStrategy());
  await Firebase.initializeApp(options: kFirebaseOptions);
  DatabaseHelper.init();

  runApp(
    MaterialApp(
      theme: ThemeData(
        toggleableActiveColor: Pallet.accent,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.cyan),
      ),
      initialRoute: Routes.home,
      onGenerateRoute: RouteConfig.onGenerateRoute,
      home: HomeScreen(),
    ),
  );
}
