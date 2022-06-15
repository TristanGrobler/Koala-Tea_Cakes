import 'package:flutter/material.dart';

import '../../category_list_page/0_category_screen.dart';
import '../../resources/title_widget.dart';
import 'category_button.dart';

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
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CategoryScreen()));
          },
        ),
        CategoryButton(
          title: 'Cup Cakes',
          image: 'images/05.jpg',
          onTap: () {},
        ),
        CategoryButton(
          title: 'Biscuits',
          image: 'images/11.jpg',
          onTap: () {},
        ),
        CategoryButton(
          title: 'Treats',
          image: 'images/03.jpg',
          onTap: () {},
        ),
        CategoryButton(
          title: 'Health Range',
          image: 'images/15.jpg',
          onTap: () {},
        ),
      ],
    );
  }
}
