import 'package:flutter/material.dart';
import 'package:ktc/category_list_page/1_cakes_category.dart';
import 'package:ktc/resources/constants.dart';
import 'package:ktc/resources/title_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: Container(
        color: kSecondaryColor.withOpacity(0.2),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: kAccentColor,
                width: width,
                height: width < 900 ? width / 20 : 65,
                child: TitleWidget(title: 'Cakes'),
              ),
              CakesCategory(),
            ],
          ),
        ),
      ),
    );
  }
}
