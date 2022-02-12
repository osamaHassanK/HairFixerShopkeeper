import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/catalog_screen/CatalogScreen.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/homescreen.dart';

import 'bottom_navigation_bar/bottom_navigator_bar.dart';

class DealsAndDiscount extends StatefulWidget {
  const DealsAndDiscount({Key? key}) : super(key: key);

  @override
  _DealsAndDiscountState createState() => _DealsAndDiscountState();
}

class _DealsAndDiscountState extends State<DealsAndDiscount> {
  CarouselController carouselController1 = CarouselController();
  CarouselController carouselController2 = CarouselController();

  final deals = [
    {
      'image': "assets/dealmen.png",
      'text1': ("Save \$5 in each and every"),
      'text2': ("\$75/-"),
      'text3': ("\$60/-"),
      'text4': ("Ends on 10/09/21 (Friday)"),
      'text5': ("0331-2471873"),
      'text6': ("DEAL 01"),
    },
    {
      'image': "assets/dealmen.png",
      'text1': "Save \$10 in each and every",
      'text2': ("\$100/-"),
      'text3': ("\$70/-"),
      'text4': ("Ends on 15/08/21 (Friday)"),
      'text5': ("0231-2431775"),
      'text6': ("DEAL 02"),
    },
    {
      'image': "assets/dealmen.png",
      'text1': "Save \$15 in each and every",
      'text2': ("\$65/-"),
      'text3': ("\$80/-"),
      'text4': ("Ends on 11/07/21 (Friday)"),
      'text5': ("0354-2456873"),
      'text6': ("DEAL 03"),
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => CatalogScreen()),
                              (route) => true);
                        },
                        child: Image.asset(
                          "assets/backarrow.png",
                          scale: 4,
                        )),
                    InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => BottomNavigatorBar()),
                            (route) => false);
                      },
                      child: Image.asset(
                        "assets/home.png",
                        scale: 4,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text("CROP SALON",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 26,
                        fontWeight: FontWeight.w900)),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(color: Color(0xffD5A300)),
                child: Center(
                    child: Text(
                  "DEALS AND DISCOUNT",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w800),
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text("LIMITED TIME DEALS",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w900)),
              ),
              SizedBox(
                height: 5,
              ),
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 440,
                    child: Column(
                      children: [
                        CarouselSlider(
                            carouselController: carouselController2,
                            items: deals
                                .asMap()
                                .map((i, deals) {
                                  return MapEntry(i, Builder(
                                    builder: (BuildContext context) {
                                      return Column(
                                        children: [
                                          Container(
                                              height: 380,
                                              margin: EdgeInsets.all(1),
                                              child: Stack(children: [
                                                Image.asset(
                                                  '${deals['image']}',
                                                  fit: BoxFit.cover,
                                                  width: double.infinity,
                                                ),
                                                Column(
                                                  children: [
                                                    Center(
                                                      child: Container(
                                                        width: 220,
                                                        height: 42,
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        10.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        10.0)),
                                                            color: Color(
                                                                0xffD5A300)),
                                                        child: Center(
                                                          child: Text(
                                                              "YOUNGS FAVOURITE DEAL",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700)),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Container(
                                                      height: 250.0,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.8,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          color:
                                                              Colors.black26),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top: 10,
                                                                        right:
                                                                            15),
                                                                child: Text(
                                                                  '${deals['text1']}',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 15,
                                                                    right: 15),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text("Services",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight.w800)),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          15),
                                                                  child: Text(
                                                                      " Service in this deal",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.w400)),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            10),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          left:
                                                                              10),
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                              ". Hair Cut",
                                                                              style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500)),
                                                                          Text(
                                                                              ". Shave",
                                                                              style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500)),
                                                                          Text(
                                                                              ". Facial",
                                                                              style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500)),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          15,
                                                                    ),
                                                                    Text(
                                                                        "Original Price",
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .white,
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.w500)),
                                                                    SizedBox(
                                                                      height: 5,
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          left:
                                                                              15),
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          Text(
                                                                              '${deals['text2']}',
                                                                              style: TextStyle(color: Color(0xffD5A300), fontSize: 23, fontWeight: FontWeight.w600)),
                                                                          Image
                                                                              .asset(
                                                                            "assets/cross.png",
                                                                            scale:
                                                                                1,
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top: 20,
                                                                        right:
                                                                            15),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Container(
                                                                      height:
                                                                          35,
                                                                      width:
                                                                          130,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                              10),
                                                                          color:
                                                                              Color(0xffD5A300)),
                                                                      child: Center(
                                                                          child: Text(
                                                                              "IN JUST   ${deals['text3']}",
                                                                              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700))),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    Text(
                                                                        "Limited Time Offer",
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              13,
                                                                        )),
                                                                    SizedBox(
                                                                      height: 5,
                                                                    ),
                                                                    Text(
                                                                        '${deals['text4']}',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              13,
                                                                        )),
                                                                    SizedBox(
                                                                      height:
                                                                          15,
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          top:
                                                                              10),
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            30,
                                                                        width:
                                                                            150,
                                                                        decoration: BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                            color: Color(0xffD5A300)),
                                                                        child: Center(
                                                                            child:
                                                                                Text("For Details Contact Us", style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600))),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 5,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Image
                                                                            .asset(
                                                                          "assets/phone.png",
                                                                          scale:
                                                                              2,
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(
                                                                              left: 10,
                                                                              right: 15),
                                                                          child: Text(
                                                                              '${deals['text5']}',
                                                                              style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700)),
                                                                        ),
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Container(
                                                      height: 40,
                                                      width: 110,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: Color(
                                                              0xffD5A300)),
                                                      child: Center(
                                                          child: Text(
                                                              '${deals['text6']}',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700))),
                                                    ),
                                                  ],
                                                )
                                              ])),
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
                                height: 390,
                                enableInfiniteScroll: false)),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                carouselController2.previousPage();
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
                                carouselController2.nextPage();
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
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
