import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ktc/constants/k_colors.dart';
import 'package:ktc/database/database_helper.dart';
import 'package:ktc/models/m_feed_item.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/k_constants.dart';
import '../../resources/title_widget.dart';

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  void launchInsta(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

  Widget carouselItem(FeedItem item, double width) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(width / 60),
      child: GestureDetector(
        onTap: () => launchInsta(item.instaUrl),
        child: Stack(
          children: [
            Image.network(
              item.imageUrl,
              width: width,
              height: width / 3,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              child: Container(
                color: Colors.black26,
                width: width / 2,
                height: width / 15,
                child: Center(
                  child: Text(
                    item.title,
                    style: TextStyle(
                      fontFamily: 'BodyFont',
                      color: Pallet.whiteText,
                      fontSize: K.adaptiveWidth(width, 35),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(height: 20.0),
        TitleWidget(title: 'Gallery'),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            //width: width < 900 ? width : 900,
            width: width,
            height: width / 3,
            child: StreamBuilder<List<FeedItem>>(
                stream: DatabaseHelper.feedItems,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Widget> carouselItems = [];
                    for (int i = 0; i < snapshot.data!.length; i++) {
                      carouselItems.add(carouselItem(snapshot.data![i], width));
                    }
                    return CarouselSlider(
                      options: CarouselOptions(
                        viewportFraction: 0.5,
                        aspectRatio: 1,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        autoPlay: true,
                        pageSnapping: true,
                        pauseAutoPlayOnTouch: true,
                      ),
                      items: carouselItems,
                    );
                  } else {
                    return Container(child: CircularProgressIndicator());
                  }
                }),
          ),
        ),
      ],
    );
  }
}
