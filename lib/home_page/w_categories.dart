import 'package:flutter/material.dart';
import 'package:ktc/home_page/w_category_button.dart';

import '../navigation/k_routes.dart';
import '../resources/w_title_widget.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.0),
        TitleWidget(title: 'Categories'),
        CategoryButton(
          title: 'Cakes',
          image: 'images/02.jpg',
          onTap: () => Navigator.pushNamed(context, Routes.cakes),
        ),
        CategoryButton(
          title: 'Cup Cakes',
          image: 'images/13.jpg',
          onTap: () => Navigator.pushNamed(context, Routes.cupCakes),
        ),
        CategoryButton(
          title: 'Cake Pops',
          image: 'images/06.jpg',
          onTap: () => Navigator.pushNamed(context, Routes.cakePops),
        ),
        CategoryButton(
          title: 'Cookies',
          image: 'images/11.jpg',
          onTap: () => Navigator.pushNamed(context, Routes.cookies),
        ),
        CategoryButton(
          title: 'Other',
          image: 'images/08.jpg',
          onTap: () => Navigator.pushNamed(context, Routes.other),
        ),
        CategoryButton(
          title: 'Health Range',
          image: 'images/15.jpg',
          onTap: () => Navigator.pushNamed(context, Routes.healthRange),
        ),
      ],
    );
  }
}
