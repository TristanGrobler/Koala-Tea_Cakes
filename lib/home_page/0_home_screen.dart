import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ktc/constants/k_strings.dart';

import '../constants/k_colors.dart';
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
    SystemChrome.setApplicationSwitcherDescription(
        ApplicationSwitcherDescription(
      label: '${Labels.titleText}',
      primaryColor: Theme.of(context).primaryColor.value,
    ));

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
