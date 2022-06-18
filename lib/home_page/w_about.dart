import 'package:flutter/material.dart';
import 'package:ktc/home_page/w_about_description.dart';
import '../resources/w_title_widget.dart';

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
