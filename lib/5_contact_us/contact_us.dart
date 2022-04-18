import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ktc/0_resources/title_widget.dart';
import 'package:ktc/5_contact_us/contact_button.dart';
import 'package:url_launcher/url_launcher.dart';

import 'kofi_button.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    Future<void> _launchInBrowser(String url) async {
      if (!await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      )) {
        throw 'Could not launch $url';
      }
    }

    return Column(
      children: [
        const SizedBox(height: 20.0),
        const TitleWidget(title: 'Contact Us'),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ContactButton(
                icon: FontAwesomeIcons.facebook,
                width: width,
                onTap: () =>
                    _launchInBrowser('https://facebook.com/koalateacakes'),
              ),
              ContactButton(
                icon: FontAwesomeIcons.instagram,
                width: width,
                onTap: () => _launchInBrowser(
                    'https://www.instagram.com/koala_teacakes/'),
              ),
              ContactButton(
                icon: FontAwesomeIcons.tumblr,
                width: width,
                onTap: () =>
                    _launchInBrowser('https://koala-teacakes.tumblr.com/'),
              ),
              KofiButton(
                width: width,
                onTap: () =>
                    _launchInBrowser('https://ko-fi.com/koala_teacakes'),
              ),
              ContactButton(
                icon: Icons.email,
                width: width,
                onTap: () => _launchInBrowser(
                    'mailto:koalateacakes@gmail.com?subject=Website%20Referral&body=Good%20Day,%20I%20would%20like%20to%20enquire%20about%20one%20of%20your%20products%20'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
