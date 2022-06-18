import 'package:flutter/material.dart';
import 'package:ktc/category_list_page/items_card_list.dart';
import 'package:ktc/constants/k_colors.dart';
import 'package:ktc/database/database_helper.dart';
import 'package:ktc/models/m_store_item.dart';
import 'package:ktc/resources/w_title_widget.dart';

import '../home_page/w_contact_us.dart';
import '../navigation/k_routes.dart';
import '../resources/w_colapsable_app_bar.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({required this.route});

  final String route;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Stream<List<StoreItem>> getStream() {
      switch (route) {
        case Routes.cakes:
          return DatabaseHelper.cakeItems;
        case Routes.cakePops:
          return DatabaseHelper.cakePopItems;
        case Routes.cupCakes:
          return DatabaseHelper.cupCakeItems;
        case Routes.cookies:
          return DatabaseHelper.cookieItems;
        case Routes.other:
          return DatabaseHelper.otherItems;
        case Routes.healthRange:
          return DatabaseHelper.healthRangeItems;
        default:
          return DatabaseHelper.cakeItems;
      }
    }

    String getTitle() {
      switch (route) {
        case Routes.cakes:
          return 'Cakes';
        case Routes.cakePops:
          return 'Cake Pops';
        case Routes.cupCakes:
          return 'Cup Cakes';
        case Routes.cookies:
          return 'Cookies';
        case Routes.other:
          return 'Other';
        case Routes.healthRange:
          return 'Health Range';
        default:
          return 'Cakes';
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Pallet.secondary.withOpacity(0.2),
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              const CollapsableAppBar(),
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              children: [
                TitleWidget(title: getTitle()),
                ItemsCardList(route: route, stream: getStream()),
                ContactUs(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
