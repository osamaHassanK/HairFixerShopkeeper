import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hairfixxer_shopkeeper/catalog%20screens/catalogforbeard.dart';
import 'package:hairfixxer_shopkeeper/catalog%20screens/catalogforfacial.dart';
import 'package:hairfixxer_shopkeeper/catalog%20screens/catalogforhair.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/edit_services.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/sk_edit_catalog.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/widget.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/text_widget.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/top_icon&title.dart';

class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            topIcon2(context, "backarrow.png", "notification.png", 4),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                child: textSk(context, "Men's Beauty Saloon", null,
                    Colors.black, FontWeight.bold, 25),
              ),
            ),
            topTitle(context, "CATALOGS"),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 8, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      child: Container(
                        height: 32,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Color(0xffD5A300),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: textSk(
                              context,
                              "Create new deals",
                              TextAlign.center,
                              Colors.white,
                              FontWeight.w600,
                              13),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditCatalog()),
                        );
                      }),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: InkWell(
                        child: Container(
                          height: 32,
                          width: 130,
                          decoration: BoxDecoration(
                            color: Color(0xffD5A300),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: textSk(
                                context,
                                "Edit Services",
                                TextAlign.center,
                                Colors.white,
                                FontWeight.w600,
                                13),
                          ),
                        ),
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => EditService()),
                          // );
                        }),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: serviceContainer(
                        BuildContext, context, "Hair Cut", gridImages[0], 30),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HairCut()));
                    },
                  ),
                  InkWell(
                    child: serviceContainer(
                        BuildContext, context, "Shave", gridImages[1], 30),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:(context)=>BeardCatalog()));
                    }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: serviceContainer(
                        BuildContext, context, "Facial", gridImages[2], 30),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:(context)=>FacialCatalog()));
                    },
                  ),
                  InkWell(
                    child:  serviceContainer(
                        BuildContext, context, "Hair Color", gridImages[3], 30),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:(context)=>FacialCatalog()));
                    },
                  ),

                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: serviceContainer(
                      BuildContext, context, "Massage", gridImages[4], 30),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>FacialCatalog()));
                  },
                ),
                InkWell(
                  child: serviceContainer(
                      BuildContext, context, "Pedicure", gridImages[7], 30),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>FacialCatalog()));
                  },
                ),

              ],
            ),
          ],
        ),
      ),
    ));
  }

  final gridImages = [
    "assets/hair1.png",
    "assets/hair2.png",
    "assets/hair3.png",
    "assets/hair4.png",
    "assets/hair5.png",
    "assets/hair6.png",
    "assets/hair7.png",
    "assets/hair8.png",
    "assets/hair9.png",
    "assets/hair10.png",
  ];
}
