import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/sk_edit_info.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/sk_notification.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/container_widget.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/text_widget.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/top_icon&title.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class SkHomeScreen extends StatefulWidget {
  const SkHomeScreen({Key? key}) : super(key: key);

  @override
  _SkHomeScreenState createState() => _SkHomeScreenState();
}

class _SkHomeScreenState extends State<SkHomeScreen> {
  var rating = 3.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    containerSk(context,30,260,Colors.white,null,
                    textSk(context,"Men's Beauty Saloon",TextAlign.center,Color(0xff4D4D4D),
                    FontWeight.bold,22)),
                    InkWell(
                      child: Image.asset(
                        "assets/notification.png",
                        scale: 4,
                      ),
                      onTap: (){ Navigator.push(context,MaterialPageRoute(
                        builder:(context) => Notifications(), ));
                      },
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Image.asset(
                    "assets/barberpic.png", fit: BoxFit.cover,
                  ),
                  Column(
                    children: [
                      Container(
                        color: Colors.transparent,
                        height: 170,
                        width: double.infinity,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                                ]
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 13.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      textSk(context,"(5.0)",null,Colors.black38,null,12),
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
                                      textSk(context,"2 Reviews",null,Colors.black38,null,12),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    textSk(context,"open",null,Color(0xffCF9B00),null,12),
                                    textSk(context,"-close 11 pm",null,Colors.black38,null,12),

                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0,right: 15.0,top: 5),
                child: Container(
                  width: double.infinity,
                  height: 160,
                  decoration: BoxDecoration(
                    color: Color(0xffFBFBFB),
                    borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0,0.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ]

                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            textSk(context,"Shop Details",null,Colors.black,FontWeight.w500,19),
                            SizedBox(
                              height: 40,
                              width: 105,

                              child: ElevatedButton(
                                child:
                                textSk(context,'Edit Details',null,Colors.white,FontWeight.w500,13),
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xffD7A700),
                                  onPrimary: Colors.white,
                                  shape: const BeveledRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(builder: (context)=> SkEditInfo(),
                                      ));},
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            textSk(context,"Shop Name:",null,Colors.black,FontWeight.w500,10),
                            SizedBox(width: 20,),
                            textSk(context,"Men's Beauty Saloon",null,Colors.black,FontWeight.w500,10),
                          ],
                        ),
                          SizedBox(height: 5,),
                        Row(
                          children: [
                            textSk(context,"Shop Address:",null,Colors.black,FontWeight.w500,10),
                            SizedBox(width: 5,),
                        textSk(context," Hanif Manzil, Shop # 02 Near Shah Abdul Latif",null,Colors.black,FontWeight.w500,10),
                          ],
                        ),
                          SizedBox(height: 2,),
                        Row(
                          children: [
                            SizedBox(width: 80,),
                            textSk(context,"Bhittai RD Lyari, Karachi, Karachi City, Sindh",null,Colors.black,FontWeight.w500,10),
                          ],
                        ),
                         SizedBox(height: 5,),
                        Row(
                          children: [
                            textSk(context,"Contact:",null,Colors.black,FontWeight.w500,10),
                            SizedBox(width: 35,),
                            textSk(context,"+923151091315",null,Colors.black,FontWeight.w500,10),
                          ],
                        ),
                          SizedBox(height: 5,),
                        Row(
                          children: [
                            textSk(context,"Shop Timings:",null,Colors.black,FontWeight.w500,10),
                            SizedBox(width: 10,),
                            textSk(context,"10AM to 12PM",null,Colors.black,FontWeight.w500,10),
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
                width: MediaQuery.of(context).size.width*0.980,
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
                            child:Container(
                              width: MediaQuery.of(context).size.width*0.790,
                              height: 150,decoration: BoxDecoration(
                                color: Color(0xffFBFBFB),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0.0,0.0), //(x,y)
                                    blurRadius: 6.0,
                                  ),
                                ]
                            ),
                              child:Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8,left:8 ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        textSk(context,"UPCOMING APOINTMENT",null,Colors.black,FontWeight.w500,14),
                                        ElevatedButton(
                                          child:
                                          textSk(context,'  Manage  \nApointment',null,Colors.white,FontWeight.w500,10),
                                          style: ElevatedButton.styleFrom(
                                            primary: Color(0xffD7A700),
                                            onPrimary: Colors.white,
                                            shape: const BeveledRectangleBorder(
                                                borderRadius:
                                                BorderRadius.all(Radius.circular(5))),
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
                                    padding: const EdgeInsets.only(left: 8,right: 8,bottom: 8),
                                    child: Row(
                                      children: [
                                        textSk(context,"Customer Name:",null,Colors.black,FontWeight.w500,10),
                                        SizedBox(width: 14,),
                                        textSk(context,"Rehan Qazmi",null,Colors.black,FontWeight.w500,10),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0,left: 8,bottom: 8),
                                    child: Row(
                                      children: [
                                        textSk(context,"Apointment Date:",null,Colors.black,FontWeight.w500,10),
                                        SizedBox(width: 12,),
                                        textSk(context,"02 september, 2021",null,Colors.black,FontWeight.w500,10),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0,left: 8,bottom: 8),
                                    child: Row(
                                      children: [
                                        textSk(context,"Apointment Time:",null,Colors.black,FontWeight.w500,10),
                                        SizedBox(width: 12,),
                                        textSk(context,"11:30AM to 12:30Am",null,Colors.black,FontWeight.w500,10),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8,right: 8,),
                                    child: Row(
                                      children: [
                                        textSk(context,"Services:",null,Colors.black,FontWeight.w500,10),
                                        SizedBox(width: 56,),
                                        textSk(context,"Hair Cut(800RS)",null,Colors.black,FontWeight.w500,10),
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
        ),
      ),
    );
  }
}
