import 'package:ktc/category_list_page/0_category_screen.dart';
import 'package:ktc/contact_us_page/contact_us_screen.dart';

import '../home_page/0_home_screen.dart';
import 'k_routes.dart';

import 'package:flutter/material.dart';

import 'navigation_path.dart';

class RouteConfig {
  /// List of [Path] to for route matching. When a named route is pushed with
  /// [Navigator.pushNamed], the route name is matched with the [Path.pattern]
  /// in the list below. As soon as there is a match, the associated builder
  /// will be returned. This means that the paths higher up in the list will
  /// take priority.
  static List<NavPath> paths = [
    NavPath(
      r'^' + Routes.home,
      (context, match) => const HomeScreen(),
    ),
    NavPath(
      r'^' + Routes.cakes,
      (context, match) => const CategoryScreen(
          //route: Routes.earrings,
          ),
    ),
    NavPath(
      r'^' + Routes.cupCakes,
      (context, match) => const CategoryScreen(
          //route: Routes.earrings,
          ),
    ),
    NavPath(
      r'^' + Routes.cakePops,
      (context, match) => const CategoryScreen(
          //route: Routes.earrings,
          ),
    ),
    NavPath(
      r'^' + Routes.cookies,
      (context, match) => const CategoryScreen(
          //route: Routes.earrings,
          ),
    ),
    NavPath(
      r'^' + Routes.other,
      (context, match) => const CategoryScreen(
          //route: Routes.earrings,
          ),
    ),
    NavPath(
      r'^' + Routes.healthRange,
      (context, match) => const CategoryScreen(
          //route: Routes.earrings,
          ),
    ),
    NavPath(
      r'^' + Routes.contactUs,
      (context, match) => const ContactUsScreen(),
    ),
  ];

  /// The route generator callback used when the app is navigated to a named
  /// route. Set it on the [MaterialApp.onGenerateRoute] or
  /// [WidgetsApp.onGenerateRoute] to make use of the [paths] for route
  /// matching.
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    for (var i = 0; i < paths.length; i++) {
      final regExpPattern = RegExp(paths[i].pattern);
      if (regExpPattern.hasMatch(settings.name ?? 'oops')) {
        final firstMatch = regExpPattern.firstMatch(settings.name ?? 'oops');

        if (firstMatch?.groupCount == 1) {
          final String? match = firstMatch?.group(1);
          return PageRouteBuilder<void>(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  paths[i].builder(context, match!),
              settings: settings,
              transitionDuration: const Duration(milliseconds: 400),
              transitionsBuilder:
                  (context, animation, anotherAnimation, child) {
                animation =
                    CurvedAnimation(curve: Curves.ease, parent: animation);
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              });
        } else {
          final String? match = firstMatch?.group(0);
          return PageRouteBuilder<void>(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  paths[i].builder(context, match!),
              settings: settings,
              transitionDuration: const Duration(milliseconds: 400),
              transitionsBuilder:
                  (context, animation, anotherAnimation, child) {
                animation =
                    CurvedAnimation(curve: Curves.ease, parent: animation);
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              });
        }
      }
    }

    // If no match was found, we let [WidgetsApp.onUnknownRoute] handle it.
    return null;
  }
}
