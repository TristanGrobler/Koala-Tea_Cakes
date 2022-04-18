import 'package:flutter/material.dart';
import 'package:ktc/0_resources/constants.dart';
import 'package:ktc/2_about/about.dart';
import 'package:ktc/3_gallery/gallery.dart';
import 'package:ktc/4_categories/categories.dart';
import 'package:ktc/5_contact_us/contact_us.dart';

import '1_appbar/colapsable_app_bar.dart';

void main() {
  runApp(const MaterialApp(home: HomeScreen()));
}

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
              children: [
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
