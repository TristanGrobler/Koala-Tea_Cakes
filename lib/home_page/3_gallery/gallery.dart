import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../resources/title_widget.dart';

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  Widget item(String path, double width) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(width / 60),
      child: Image.asset(
        path,
        width: width < 900 ? width * 9 / 16 : 900,
        height: width < 900 ? width / 16 * 9 : 506,
        fit: BoxFit.cover,
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
            height: width < 900 ? width / 3 : width / 3,
            child: CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 0.5,
                aspectRatio: 1,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                autoPlay: true,
                pageSnapping: true,
                pauseAutoPlayOnTouch: true,
              ),
              items: [
                item('images/01.jpg', width),
                item('images/02.jpg', width),
                item('images/03.jpg', width),
                item('images/04.jpg', width),
                item('images/05.jpg', width),
                item('images/06.jpg', width),
                item('images/07.jpg', width),
                item('images/08.jpg', width),
                item('images/10.jpg', width),
                item('images/11.jpg', width),
                item('images/12.jpg', width),
                item('images/13.jpg', width),
                item('images/14.jpg', width),
                item('images/15.jpg', width),
                item('images/16.jpg', width),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
