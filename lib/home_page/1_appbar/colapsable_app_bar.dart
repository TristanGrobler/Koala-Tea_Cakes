import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ktc/constants/k_colors.dart';
import 'dart:math' as math;

class CollapsableAppBar extends StatelessWidget {
  const CollapsableAppBar();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SliverAppBar(
      toolbarHeight: width > 900 ? 120 : width / 10,
      elevation: 2.0,
      shadowColor: Pallet.accent,
      backgroundColor: Colors.black,
      expandedHeight: width > 900 ? 400 : width / 9 * 3,
      collapsedHeight: width > 900 ? 120 : width / 10,
      floating: false,
      pinned: true,
      automaticallyImplyLeading: false,
      flexibleSpace: LayoutBuilder(
        builder: (context, c) {
          final settings = context
              .dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
          final deltaExtent = settings!.maxExtent - settings.minExtent;
          final t = (1.0 -
                  (settings.currentExtent - settings.minExtent) / deltaExtent)
              .clamp(0.0, 1.0);
          final fadeStart = math.max(0.0, 1.0 - kToolbarHeight / deltaExtent);
          const fadeEnd = 1.0;
          final opacity = 1.0 - Interval(fadeStart, fadeEnd).transform(t);

          return Stack(
            children: [
              Opacity(
                opacity: 1 - opacity,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [getImage(context)],
                ),
              ),
              Opacity(
                opacity: opacity,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Positioned(
                      top: 0,
                      bottom: 0,
                      child: getImage(context),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget getImage(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(bottom: 0.0),
        width: MediaQuery.of(context).size.width,
        child: Image.asset('images/banner.jpg', fit: BoxFit.cover),
      ),
    );
  }
}
