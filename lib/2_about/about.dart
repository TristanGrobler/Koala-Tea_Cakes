import 'package:flutter/material.dart';
import 'package:ktc/0_resources/title_widget.dart';
import 'package:ktc/2_about/about_description.dart';

import '../0_resources/constants.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TitleWidget(title: 'About Us'),
        AboutDescription(),
      ],
    );
  }
}
