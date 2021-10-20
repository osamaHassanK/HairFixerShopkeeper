import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ShopRegistrationForm extends StatefulWidget {
  const ShopRegistrationForm({Key? key}) : super(key: key);

  @override
  State<ShopRegistrationForm> createState() => _ShopRegistrationFormState();
}

var height = "MediaQuery.of(context).size.height";
var width = "MediaQuery.of(context).size.height";

class _ShopRegistrationFormState extends State<ShopRegistrationForm> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Positioned(
                      top: MediaQuery.of(context).size.height * 0.370,
                      left: MediaQuery.of(context).size.width * 0.280,
                      child: Image.asset(
                        "assets/logoshopregistration.png",
                        scale: 3.4,
                      )),
                  Column(
                    children: [
                      SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/profilepic.png",
                            scale: 5,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Hello,",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffD7A600),
                            ),
                          ),
                          Text(
                            "Hamza",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Color(0xffD7A600),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "registered your shop",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff474747),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: const [
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "1. Enter your Shop Name",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff474747),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
                        child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "e.g Men’s Beauty Salon",
                              filled: true,
                              fillColor: Color(0xffF6F6F6),
                              contentPadding:
                              const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(10)),
                            )),
                      ),
                      Row(
                        children: const [
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "2. Enter your Shop Address",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff474747),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
                        child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "e.g Men’s Beauty Salon",
                              filled: true,
                              fillColor: Color(0xffF6F6F6),
                              contentPadding:
                              const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xffF6F6F6)),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            )),
                      ),
                      Row(
                        children: const [
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "3. Upload your Image",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff474747),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.850,
                          height: MediaQuery.of(context).size.height * 0.250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffF6F6F6),
                          ),
                          child: Center(
                              child: Image.asset(
                                "assets/uploadImage.png",
                                scale: 3,
                              )),
                        ),
                      ),
                      Row(
                        children: const [
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "3. Enter Opening and Closing Timing",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff474747),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 60,
                        height: 27,
                        color: Colors.red,
                        child: TextFormField(

                            decoration: InputDecoration(
                              labelText: "10 AM",
                              filled: true,
                              fillColor: Color(0xffF6F6F6),
                              contentPadding:
                              const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xffF6F6F6),),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            )),
                      ),

                      // Text("To",style: TextStyle(fontSize: 25),),
                      // TextFormField(
                      //   decoration: InputDecoration(
                      //     labelText: "10 AM",
                      //     filled: true,
                      //     focusedBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(color: Colors.black),
                      //         borderRadius: BorderRadius.circular(10)),

                      // Text("To",style: TextStyle(color: Colors.black),),
                      // TextFormField(
                      //   decoration: InputDecoration(
                      //       labelText: "11 PM",
                      //       filled: true,
                      //       focusedBorder: OutlineInputBorder(
                      //           borderSide: BorderSide(color: Color(0xffF6F6F6)),
                      //           borderRadius: BorderRadius.circular(10)
                      //      )
                      //  ),

                      // ),
                      //   ),
                      //   ),
                    ],
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
