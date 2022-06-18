import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ktc/constants/k_colors.dart';

import '../models/m_store_item.dart';

class ItemsCardList extends StatelessWidget {
  ItemsCardList({required this.route, required this.stream});

  final String route;
  final Stream<List<StoreItem>> stream;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return StreamBuilder<List<StoreItem>>(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return MasonryGridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 6,
              crossAxisSpacing: 4,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                StoreItem item = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Container(
                      color: Pallet.secondary.withOpacity(0.7),
                      child: Column(
                        children: [
                          ClipPath(
                            clipper: WaveClipperTwo(flip: true),
                            child: Container(
                              width: width < 900 ? width : 900,
                              height: (((index + 1) % 3 + 1) * 2) * 100,
                              child: ShaderMask(
                                shaderCallback: (rect) {
                                  return LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Colors.black, Colors.grey],
                                  ).createShader(Rect.fromLTRB(
                                      0, 200, rect.width, rect.height));
                                },
                                blendMode: BlendMode.dstIn,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                  ),
                                  child: Image.network(
                                    item.imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              item.title,
                              style: TextStyle(
                                  fontSize: width < 900 ? width / 25 : 40,
                                  fontFamily: 'HeadingFont'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              item.cost,
                              style: TextStyle(
                                fontSize: width < 900 ? width / 30 : 30,
                                fontFamily: 'BodyFont',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Container(
              height: height,
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
        });
  }
}
