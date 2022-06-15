import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ktc/resources/constants.dart';
import 'package:ktc/resources/title_widget.dart';

class CakesCategory extends StatelessWidget {
  const CakesCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 1000,
          width: width < 900 ? width : 900,
          child: MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 6,
            crossAxisSpacing: 4,
            itemCount: 20,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  child: Container(
                    color: kSecondaryColor.withOpacity(0.7),
                    child: Column(
                      children: [
                        ClipPath(
                          clipper: WaveClipperTwo(flip: true),
                          child: Container(
                            width: width < 900 ? width : 900,
                            height: (((index + 1) % 2 + 1) * 2) * 200,
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
                                child: Image.asset(
                                  'images/01.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Candy Floss Drip Cake',
                            style: TextStyle(
                                fontSize: width < 900 ? width / 25 : 40,
                                fontFamily: 'HeadingFont'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Beautiful 3 layered cake, smothered in dripping white chocolate and topped with candy floss.',
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
          ),
        ),
      ],
    );
  }
}
