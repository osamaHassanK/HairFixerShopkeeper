import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hairfixxer_shopkeeper/Utilities/FirestoreDbRerences.dart';
import 'package:hairfixxer_shopkeeper/Utilities/my_navigator.dart';
import 'package:hairfixxer_shopkeeper/auth/app_colors.dart';
import 'package:hairfixxer_shopkeeper/model/ShopInfo.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/MyContainer.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/container_widget.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/loading_widget.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/my_text_widget.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/text_widget.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/edit_shop_screen/edit_shop_screen.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/sk_notification.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../main.dart';

class SkHomeScreen extends StatefulWidget {
  const SkHomeScreen({Key? key}) : super(key: key);

  @override
  _SkHomeScreenState createState() => _SkHomeScreenState();
}

class _SkHomeScreenState extends State<SkHomeScreen> with RouteAware {
  var rating = 3.0;
  var shopName = "No Name";
  var shopAddress = "No Address";
  var shopOpenTiming = "time is unavailable";
  var shopClosingTiming = "time is unavailable";
  var shopImageUrl = "";

  late List<DocumentSnapshot>? shopData;

@override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: FutureBuilder(
            future: shopUserRef.get(),
            builder: (context,
                AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                    snapshot) {
              //var shop=snapshot.data as QuerySnapshot<Map<String, dynamic>> ;

              if (snapshot.connectionState == ConnectionState.waiting) {
                return LoadingWidget();
              }
              return Stack(
                children: [
                    myContainer(context: context
                      ,child: Image.asset('assets/home_screen_bg.png',fit: BoxFit.cover, ),height: 1,width: 1,),

                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            containerSk(
                                context,
                                30,
                                260,
                                Colors.transparent,
                                null,
                                myResponsiveText(
                                  marginLeft: 12,
                                    text: snapshot.data!['shopInfo']['shopName'],
                                    align: TextAlign.start,
                                    textColor:Colors.black,
                                    weight: FontWeight.bold,
                                    initialFontSize: 22)),
                            InkWell(
                              child: Image.asset(
                                "assets/notification.png",
                                scale: 4,
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Notifications(),
                                    ));
                              },
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Column(
                            children: [
                              myContainer(
                                radiusValue: 20,
                                context:context,
                                marginLeft: 20,
                                marginRight: 20,
                                width: 1,
                                height: 0.3,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    progressIndicatorBuilder: (context, url,
                                        downloadProgress) =>
                                        Center(
                                            child:
                                            CircularProgressIndicator(
                                                color: AppColor.APP_YELLOW_COLOR,
                                                strokeWidth: 3,
                                                value: downloadProgress
                                                    .progress)),
                                    imageUrl: snapshot.data!['shopInfo']['shopImgUrl'],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height*0.03,
                              )

                            ],
                          ),


                          Container(
                            height: 63,
                            width: 230,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0.0, 01.0), //(x,y)
                                    blurRadius: 6.0,
                                  ),
                                ]),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 13.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      textSk(context, "(5.0)", null,
                                          Colors.black38, null, 12),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      SmoothStarRating(
                                          size: 16,
                                          allowHalfRating: true,
                                          color: Color(0xffE5AC00),
                                          starCount: 5,
                                          rating: rating,
                                          borderColor: Colors.amber,
                                          onRated: (value) {
                                            print("rating value -> $value");
                                          }),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      textSk(context, "2 Reviews", null,
                                          Colors.black38, null, 12),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    textSk(context, "open", null,
                                        Color(0xffCF9B00), null, 12),
                                    textSk(context, "-close 11 pm", null,
                                        Colors.black38, null, 12),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 24.0, right: 15.0, top: 5),
                        child: Container(
                          width: double.infinity,
                          height: 160,
                          decoration: BoxDecoration(
                              color: Color(0xffFBFBFB),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0.0, 0.0), //(x,y)
                                  blurRadius: 6.0,
                                ),
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    myResponsiveText(
                                        text: "Shop Details",
                                        textColor: Colors.black,
                                        weight: FontWeight.w500,
                                        initialFontSize: 19),
                                    InkWell(
                                      onTap: () {

                                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditShopScreen(
                                            shop: Shop.withoutCatalogStatus(
                                              snapshot.data!['shopInfo']['shopId'],
                                              snapshot.data!['shopInfo']['shopName'],
                                              snapshot.data!['shopInfo']['shopAddress'],
                                              snapshot.data!['shopInfo']['shopContactNo'],
                                              snapshot.data!['shopInfo']['shopImgUrl'],
                                              snapshot.data!['shopInfo']['shopOpeningTiming'],
                                              snapshot.data!['shopInfo']['shopClosingTiming'],
                                              snapshot.data!['shopInfo']['shopLocation'],

                                            )))).then((value){
                                          setState(() {

                                          });

                                        });
                                        // goToNextScreen(
                                        //     context,
                                        //     SkEditInfo(
                                        //         shop: Shop.withoutCatalogStatus(
                                        //             snapshot.data!['shopId'],
                                        //             snapshot.data!['shopName'],
                                        //             snapshot.data!['shopAddress'],
                                        //             snapshot.data!['shopContactNo'],
                                        //             snapshot.data!['shopImgUrl'],
                                        //             snapshot.data!['shopOpeningTiming'],
                                        //           snapshot.data!['shopClosingTiming'],
                                        //           snapshot.data!['shopLocation'],
                                        //
                                        //         )));
                                      },
                                      child: myUnResponsiveContainer(
                                        marginRight: 25,
                                        marginBottom: 15,
                                        marginLeft: 15,
                                        context: context,
                                        child: Icon(
                                          Icons.edit,
                                          color: AppColor.APP_YELLOW_COLOR,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    myResponsiveText(
                                        text: "Shop Name:",
                                        textColor: Colors.black,
                                        weight: FontWeight.w500,
                                        initialFontSize: 10),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    myResponsiveText(
                                        text: snapshot.data!['shopInfo']['shopName'],
                                        textColor: Colors.black,
                                        weight: FontWeight.w500,
                                        initialFontSize: 10),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    myResponsiveText(
                                        text: "Shop Address:",
                                        textColor: Colors.black,
                                        weight: FontWeight.w500,
                                        initialFontSize: 10),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    myResponsiveText(
                                        text: snapshot.data!['shopInfo']['shopAddress'],
                                        textColor: Colors.black,
                                        weight: FontWeight.w500,
                                        initialFontSize: 10),
                                  ],
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    myResponsiveText(
                                        text: "Contact:",
                                        textColor: Colors.black,
                                        weight: FontWeight.w500,
                                        initialFontSize: 10),
                                    myResponsiveText(
                                        text: snapshot.data!['shopInfo']['shopContactNo'],
                                        textColor: Colors.black,
                                        weight: FontWeight.w500,
                                        initialFontSize: 10,
                                        marginLeft: 24),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    myResponsiveText(
                                        text: "Shop Timings:",
                                        textColor: Colors.black,
                                        weight: FontWeight.w500,
                                        initialFontSize: 10),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    myResponsiveText(
                                        text: snapshot.data!['shopInfo']['shopOpeningTiming'] +
                                            ' To ' +
                                            snapshot.data!['shopInfo']['shopClosingTiming'],
                                        textColor: Colors.black,
                                        weight: FontWeight.w500,
                                        initialFontSize: 10),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 200,
                        width: MediaQuery.of(context).size.width * 0.980,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 7,
                          shrinkWrap: true,
                          padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: InkWell(
                                    onTap: () {
//Navigator.pushNamed(context, '/message');
                                    },
                                    child: Container(
                                      width:
                                      MediaQuery.of(context).size.width * 0.790,
                                      height: 150,
                                      decoration: BoxDecoration(
                                          color: Color(0xffFBFBFB),
                                          borderRadius: BorderRadius.circular(12),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.black26,
                                              offset: Offset(0.0, 0.0), //(x,y)
                                              blurRadius: 6.0,
                                            ),
                                          ]),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8, left: 8),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                textSk(
                                                    context,
                                                    "UPCOMING APOINTMENT",
                                                    null,
                                                    Colors.black,
                                                    FontWeight.w500,
                                                    14),
                                                ElevatedButton(
                                                  child: textSk(
                                                      context,
                                                      '  Manage  \nApointment',
                                                      null,
                                                      Colors.white,
                                                      FontWeight.w500,
                                                      10),
                                                  style: ElevatedButton.styleFrom(
                                                    primary: Color(0xffD7A700),
                                                    onPrimary: Colors.white,
                                                    shape:
                                                    const BeveledRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                5))),
                                                  ),
                                                  onPressed: () {},
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                            width: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8, right: 8, bottom: 8),
                                            child: Row(
                                              children: [
                                                textSk(
                                                    context,
                                                    "Customer Name:",
                                                    null,
                                                    Colors.black,
                                                    FontWeight.w500,
                                                    10),
                                                SizedBox(
                                                  width: 14,
                                                ),
                                                textSk(
                                                    context,
                                                    "Rehan Qazmi",
                                                    null,
                                                    Colors.black,
                                                    FontWeight.w500,
                                                    10),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0, left: 8, bottom: 8),
                                            child: Row(
                                              children: [
                                                textSk(
                                                    context,
                                                    "Apointment Date:",
                                                    null,
                                                    Colors.black,
                                                    FontWeight.w500,
                                                    10),
                                                SizedBox(
                                                  width: 12,
                                                ),
                                                textSk(
                                                    context,
                                                    "02 september, 2021",
                                                    null,
                                                    Colors.black,
                                                    FontWeight.w500,
                                                    10),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0, left: 8, bottom: 8),
                                            child: Row(
                                              children: [
                                                textSk(
                                                    context,
                                                    "Apointment Time:",
                                                    null,
                                                    Colors.black,
                                                    FontWeight.w500,
                                                    10),
                                                SizedBox(
                                                  width: 12,
                                                ),
                                                textSk(
                                                    context,
                                                    "11:30AM to 12:30Am",
                                                    null,
                                                    Colors.black,
                                                    FontWeight.w500,
                                                    10),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 8,
                                              right: 8,
                                            ),
                                            child: Row(
                                              children: [
                                                textSk(
                                                    context,
                                                    "Services:",
                                                    null,
                                                    Colors.black,
                                                    FontWeight.w500,
                                                    10),
                                                SizedBox(
                                                  width: 56,
                                                ),
                                                textSk(
                                                    context,
                                                    "Hair Cut(800RS)",
                                                    null,
                                                    Colors.black,
                                                    FontWeight.w500,
                                                    10),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),


                ],

              );
            },
          ),
        ),
      ),
    );
  }



}
