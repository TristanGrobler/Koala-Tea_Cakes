import 'package:flutter/material.dart';
import '../../resources/title_widget.dart';
import 'about_description.dart';

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
