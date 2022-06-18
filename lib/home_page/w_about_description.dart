import 'package:flutter/material.dart';

import '../../constants/k_strings.dart';

class AboutDescription extends StatelessWidget {
  const AboutDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: width < 900 ? width : 900,
      child: Padding(
        padding: EdgeInsets.all(width < 900 ? width / 40 : 22),
        child: Text(
          Labels.aboutUsDescription,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: width < 900 ? width / 30 : 30,
            fontFamily: 'BodyFont',
          ),
        ),
      ),
    );
  }
}
