import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/sk_edit_info.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/sk_shop_creation.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'bottomnavigatorbar.dart';

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
                padding: const EdgeInsets.only(top: 8.0,left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/backarrow.png",
                          scale: 4,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/notification.png",
                          scale: 4,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          child: Image.asset(
                            "assets/settingicon.png",
                            scale: 4,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 40,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Text(
                    "Men's Beauty Saloon",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff4D4D4D),
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                color: Colors.white,
              ),
              Stack(
                children: [
                  Image.asset(
                    "assets/barberpic.png", fit: BoxFit.cover,
                    //height:MediaQuery.of(context).size.height*0.3,
                    //width: double.infinity,
                  ),
                  Column(
                    children: [
                      Container(
                        color: Colors.transparent,
                        height: 180,
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
                                      Text(
                                        "(5.0)",
                                        style: TextStyle(color: Colors.black38),
                                      ),
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
                                      Text("2 Reviews",
                                          style: TextStyle(
                                            color: Colors.black38,
                                          )),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "open",
                                      style: TextStyle(
                                          color: Color(0xffCF9B00),
                                          fontSize: 12),
                                    ),
                                    Text(
                                      "-close 11 pm",
                                      style: TextStyle(
                                          color: Colors.black38, fontSize: 12),
                                    ),
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
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.infinity,
                  height: 170,
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
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Shop Details",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                            ElevatedButton(
                              child: Text(
                                'Edit Details',
                                style: TextStyle(fontSize: 13),
                              ),
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
                          ],
                        ),
                        Row(
                          children: [
                            Text("Shop Name:",style: TextStyle(fontSize: 10)),
                            SizedBox(width: 20,),
                            Text("Men's Beauty Saloon",style: TextStyle(fontSize: 10))
                          ],
                        ),
                          SizedBox(height: 8,),
                        Row(
                          children: [
                            Text("Shop Address:",style: TextStyle(fontSize: 10),),
                            SizedBox(width: 5,),
                            Text(" Hanif Manzil, Shop # 02 Near Shah Abdul Latif",
                             style: TextStyle(fontSize: 10)),
                          ],
                        ),
                          SizedBox(height: 8,),
                        Row(
                          children: [
                            SizedBox(width: 72,),
                            Text("Bhittai RD Lyari, Karachi, Karachi City, Sindh",
                                style: TextStyle(fontSize: 10))
                          ],
                        ),
                         SizedBox(height: 8,),
                        Row(
                          children: [
                            Text("Contact:",style: TextStyle(fontSize: 10)),
                            SizedBox(width: 35,),
                            Text("+923151091315",style: TextStyle(fontSize: 10))
                          ],
                        ),
                          SizedBox(height: 8,),
                        Row(
                          children: [
                            Text("Shop Timings:",style: TextStyle(fontSize: 10)),
                            SizedBox(width: 10,),
                            Text("10AM to 12PM",style: TextStyle(fontSize: 10))
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width*0.980,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  shrinkWrap: true,
                  padding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
//Navigator.pushNamed(context, '/message');
                            },
                            child:Container(
                              width: MediaQuery.of(context).size.width*0.920,
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
                                        Text(
                                          "Upcomming Apointments",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black),
                                        ),
                                        ElevatedButton(
                                          child: Text(
                                            '  Manage  \nApointment',
                                            style: TextStyle(fontSize: 11),
                                          ),
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
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8,right: 8,bottom: 8),
                                    child: Row(
                                      children: [
                                        Text("Customer Name:",style: TextStyle(fontSize: 10)),
                                        SizedBox(width: 13,),
                                        Text("Rehan Qazmi",style: TextStyle(fontSize: 10))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0,left: 8,bottom: 8),
                                    child: Row(
                                      children: [
                                        Text("Apointment Date:",style: TextStyle(fontSize: 10),),
                                        SizedBox(width: 12,),
                                        Text("02 september, 2021",
                                            style: TextStyle(fontSize: 10)),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0,left: 8,bottom: 8),
                                    child: Row(
                                      children: [
                                        Text("Apointment Time:",style: TextStyle(fontSize: 10),),
                                        SizedBox(width: 5,),
                                        Text("11:30AM to 12:30Am",
                                            style: TextStyle(fontSize: 10)),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8,right: 8,),
                                    child: Row(
                                      children: [
                                        Text("Services:",style: TextStyle(fontSize: 10)),
                                        SizedBox(width: 45,),
                                        Text("Hair Cut(800RS)",style: TextStyle(fontSize: 10))
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
