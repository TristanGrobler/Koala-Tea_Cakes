import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ktc/0_resources/constants.dart';

class ContactButton extends StatelessWidget {
  ContactButton({required this.icon, required this.width, required this.onTap});
  IconData icon;
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
            child: FaIcon(
              icon,
              size: getSize(width) / 3 * 2,
              color: kAccentColor,
            ),
          ),
        ),
      ),
    );
  }
}
