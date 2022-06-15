import 'package:flutter/material.dart';
import 'package:ktc/category_list_page/0_category_screen.dart';

import '../resources/constants.dart';
import '1_appbar/colapsable_app_bar.dart';
import '2_about/about.dart';
import '3_gallery/gallery.dart';
import '4_categories/categories.dart';
import '5_contact_us/contact_us.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: kSecondaryColor.withOpacity(0.2),
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              const CollapsableAppBar(),
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              children: const [
                AboutUs(),
                Gallery(),
                Categories(),
                ContactUs(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
