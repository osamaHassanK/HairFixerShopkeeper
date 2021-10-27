import 'package:flutter/material.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/shop_registration.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/sign_in.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/sk_homescreen.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/sk_notification.dart';

class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = <Widget>[
      SkHomeScreen(),
      Notifications(),
      LoginScreen(),
      Services(),
      ShopRegistration(),
      SkHomeScreen(),
      Notifications(),
      LoginScreen(),
      Services(),
      ShopRegistration(),
    ];

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
    final text1 = [
      "Hair Cut",
      "Shave",
      "Body Treatment",
      "Body Treatment",
      "Pedicure",
      "Manicure",
      "Hair Spa",
      "Hand & Foot Spa",
      "Massage",
      "Hair Removal",
    ];
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0,right: 8,left: 8,bottom: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context, '/shopdetail');
                          },
                          child: Image.asset(
                            "assets/backarrow.png",
                            scale: 4,
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context, '/homePage');
                        },
                        child: Image.asset(
                          "assets/notification.png",
                          scale: 4,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context, '/homePage');
                        },
                        child: Image.asset(
                          "assets/settingicon.png",
                          scale: 4,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),


            Container(
              width: MediaQuery.of(context).size.width,
              height: 45,
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                  child: Text(
                    "Men's Beauty Saloon",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  )),
            ),


            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(color: Color(0xffD5A300)),
              child: Center(
                  child: Text(
                "Services",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Container(
                    height: 32,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Color(0xffD5A300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Deals and Discounts",style: TextStyle(
                        color: Colors.white,fontSize: 13),textAlign: TextAlign.center,),
                    ),
                  ),
                  Container(
                    height: 32,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Color(0xffD5A300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Edit Service",style: TextStyle(
                          color: Colors.white,fontSize: 13),textAlign: TextAlign.center,),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children:[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,top: 8.0),
                      child: Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 7,
                              offset: Offset(0,02), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: const Text("Hair Cut",textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.black,fontSize: 13),
                            ),
                          ),
                        ),
                       ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6.0,top: 8,),
                      child: Container(
                        width: 154,
                        height: 72.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(gridImages[0],
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Stack(
                  children:[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,top: 8.0),
                      child: Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 7,
                              offset: Offset(0,02), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: const Text("Hair Cut",textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black,fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6.0,top: 8,),
                      child: Container(
                        width: 154,
                        height: 72.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(gridImages[0],
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    )
                  ],
                ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children:[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,top: 8.0),
                      child: Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 7,
                              offset: Offset(0,02), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: const Text("Hair Cut",textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black,fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6.0,top: 8,),
                      child: Container(
                        width: 154,
                        height: 72.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(gridImages[0],
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Stack(
                  children:[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,top: 8.0),
                      child: Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 7,
                              offset: Offset(0,02), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: const Text("Hair Cut",textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black,fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6.0,top: 8,),
                      child: Container(
                        width: 154,
                        height: 72.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(gridImages[0],
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    )
                  ],
                ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children:[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,top: 8.0),
                      child: Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 7,
                              offset: Offset(0,02), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: const Text("Hair Cut",textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black,fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6.0,top: 8,),
                      child: Container(
                        width: 154,
                        height: 72.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(gridImages[0],
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Stack(
                  children:[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,top: 8.0),
                      child: Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 7,
                              offset: Offset(0,02), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: const Text("Hair Cut",textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black,fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6.0,top: 8,),
                      child: Container(
                        width: 154,
                        height: 72.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(gridImages[0],
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    )
                  ],
                ),

              ],
            ),



          ],
        ),
      ),
    ));
  }
}
