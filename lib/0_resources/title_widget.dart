import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Padding(
        padding: EdgeInsets.all(width < 900 ? width / 40 : 22),
        child: Text(
          title,
          style: TextStyle(
              fontSize: width < 900 ? width / 15 : 60,
              fontFamily: 'HeadingFont'),
        ),
      ),
    );
  }
}
