import 'package:flutter/material.dart';
import 'package:ktc/0_resources/constants.dart';

class CategoryButton extends StatelessWidget {
  CategoryButton(
      {required this.title, required this.image, required this.onTap});

  String title, image;
  Function() onTap;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width < 900 ? width : 900,
        height: width < 900 ? width / 7 : 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width / 60),
          // boxShadow: [
          //   BoxShadow(
          //     color: kAccentColor.withOpacity(0.1),
          //     spreadRadius: 2,
          //     blurRadius: 2,
          //     offset: Offset(0, 0), // changes position of shadow
          //   ),
          // ],
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(width / 60),
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  width: width < 900 ? width : 900,
                  height: width < 900 ? width / 7 : 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    width: width < 900 ? width : 900,
                    height: width < 900 ? width / 7 : 130,
                    color: Colors.black.withOpacity(0.5),
                    child: Padding(
                      padding: EdgeInsets.all(width < 900 ? width / 40 : 22),
                      child: Center(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: width < 900 ? width / 20 : 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'BodyFont',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
