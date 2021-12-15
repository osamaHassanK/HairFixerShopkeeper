import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/bottomnavigatorbar.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/sk_notification.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/container_widget.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/dialogueshow.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/text_widget.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/top_icon&title.dart';

import '../base.dart';

class FacialCatalog extends StatefulWidget {
  const FacialCatalog({Key? key}) : super(key: key);

  @override
  _FacialCatalogState createState() => _FacialCatalogState();
}

class _FacialCatalogState extends State<FacialCatalog> {
  CarouselController carouselController = CarouselController();

  List<Color> _colors = <Color>[
    Colors.black12,
    Color(0xff3DB0F4),
  ];
  int _currentColorIndex = 0;
  void _incrementColorIndex() {
    setState(() {
      if (_currentColorIndex < _colors.length - 1) {
        _currentColorIndex++;
      } else {
        _currentColorIndex = 0;
      }
    });
  }
  final haircut = [
    {
      'image': "assets/haircut1.png",
      'text1': ("Special Facial"),
      'text2': ("HC 4577"),
    },
    {
      'image': "assets/haircut1.png",
      'text1': "Gold Premium Facial",
      'text2': ("HC 7037"),
    },
    {
      'image': "assets/haircut2.png",
      'text1': "Whitening Facial",
      'text2': ("HC 7897"),
    }
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              topIcon(context,"backarrow.png","notification.png",4,BottomNavigatorBar()),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    containerSk(context,30,260,Colors.white,null,
                        textSk(context,"Men's Beauty Saloon",TextAlign.center,Color(0xff4D4D4D),
                            FontWeight.bold,20)),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              topTitle(context,"Facial and Skincare Catalog"),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 510,
                child: Column(
                  children: [
                    CarouselSlider(
                        carouselController: carouselController,
                        items: haircut
                            .asMap()
                            .map((i, haircut) {
                          return MapEntry(i, Builder(
                            builder: (BuildContext context) {
                              return Column(
                                children: [
                                  Text(
                                    '${haircut['text1']}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    '${haircut['text2']}',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Container(
                                      height: 370,
                                      margin: EdgeInsets.all(15),
                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(20),
                                        child: Image.asset(
                                          '${haircut['image']}',
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                        ),
                                      )),
                                ],
                              );
                            },
                          ));
                        })
                            .values
                            .toList(),
                        options: CarouselOptions(
                            autoPlay: false,
                            viewportFraction: 1,
                            height: 440,
                            enableInfiniteScroll: false)),
                    Spacer(
                      flex: 2,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            carouselController.previousPage();
                          },
                          child: Container(
                              width: 50,
                              height: 30,
                              child: Image.asset(
                                "assets/next1.png",
                                scale: 1,
                              )),
                        ),
                        InkWell(
                          onTap: () {
                            carouselController.nextPage();
                          },
                          child: Container(
                              width: 50,
                              height: 30,
                              child: Image.asset(
                                "assets/next2.png",
                                scale: 1,
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}