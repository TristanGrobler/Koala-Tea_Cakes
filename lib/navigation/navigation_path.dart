import 'package:flutter/material.dart';

class NavPath {
  const NavPath(this.pattern, this.builder);

  final String pattern;
  final Widget Function(BuildContext, String) builder;
}
