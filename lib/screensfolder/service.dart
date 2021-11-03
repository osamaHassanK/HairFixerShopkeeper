

import 'package:flutter/material.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/edit_services.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/sk_edit_catalog.dart';


class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {

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
                              Navigator.pop(context,true);
                            },
                            child: Image.asset(
                              "assets/notification.png",
                              scale: 4,
                            ),
                          ),
                          const SizedBox(
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
                  height: 40,
                  decoration: BoxDecoration(color: Colors.white),
                  child: const Center(
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
                  height: 45,
                  decoration: BoxDecoration(color: Color(0xffD5A300)),
                  child: const Center(
                      child: Text(
                        "Services",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0,top: 8,bottom: 8),
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
                              child: Text("Create new deals",style: TextStyle(
                                  color: Colors.white,fontSize: 13),textAlign: TextAlign.center,),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => EditCatalog()),
                            );
                          }
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: InkWell(
                            child: Container(
                              height: 32,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Color(0xffD5A300),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Edit Services",style: TextStyle(
                                    color: Colors.white,fontSize: 13),textAlign: TextAlign.center,),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => EditService()),
                              );
                            }
                        ),
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
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
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(gridImages[5],
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("30\$"),
                          ),
                        ],
                      ),
                      Column(
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
                                  child: const Align(
                                    alignment: FractionalOffset.bottomCenter,
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 8.0),
                                      child: Text("Shave",textAlign: TextAlign.center,
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
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(gridImages[1],
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("50\$"),
                          ),

                        ],
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
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
                                      child: const Text("Facial",textAlign: TextAlign.center,
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
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(gridImages[2],
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("30\$"),
                          ),
                        ],
                      ),
                      Column(
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
                                      child: const Text("Hair Color",textAlign: TextAlign.center,
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
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(gridImages[3],
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("30\$"),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
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
                                    child: const Text("Massage",textAlign: TextAlign.center,
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
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(gridImages[4],
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("30\$"),
                        ),
                      ],
                    ),
                    Column(
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
                                child: const Align(
                                  alignment: FractionalOffset.bottomCenter,
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 8.0),
                                    child: Text("Pedicure",textAlign: TextAlign.center,
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
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(gridImages[7],
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("30\$"),
                        ),

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