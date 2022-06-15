import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ktc/resources/constants.dart';

class KofiButton extends StatelessWidget {
  KofiButton({required this.width, required this.onTap});
  double width;
  Function() onTap;

  double getSize(double width) {
    if (width < 400) {
      return 30;
    } else if (width > 900) {
      return 52;
    } else {
      return width / 17;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: kSecondaryColor,
          ),
          width: getSize(width),
          height: getSize(width),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(width / 150),
              child: SvgPicture.asset(
                'images/kofi.svg',
                fit: BoxFit.fitWidth,
                width: getSize(width),
                color: kAccentColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
