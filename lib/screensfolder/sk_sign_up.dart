import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:hairfixxer_shopkeeper/base.dart';
import 'package:hairfixxer_shopkeeper/widget/button_widget.dart';
import 'package:hairfixxer_shopkeeper/widget/container_widget.dart';
import 'package:hairfixxer_shopkeeper/widget/text_widget.dart';

class SignUpScreen extends StatelessWidget {
  TextField1 _text = TextField1();
//  WidgetsSk _widgetcall= WidgetsSk();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              Column(children: [
                Stack(
                  children: [
                    // Container(
                    //   width: double.infinity,
                    //   height: 100,
                    //   color: Colors.red,
                    // ),
                    containerSk(context, 100, double.infinity, Colors.white,
                        BorderRadius.circular(0), null, null),
                  ],
                ),
                Stack(children: [
                  containerSk(
                      context,
                      650,
                      double.infinity,
                      Colors.white,
                      BorderRadius.circular(0),
                      null,
                      imageSk("assets/screen.png", 4, BoxFit.cover)),
                  // Container(
                  //     height: 650,
                  //     width: double.infinity,
                  //     child: Image.asset(
                  //       "assets/screen.png",
                  //       fit: BoxFit.cover,
                  //     )),
                  Positioned(
                      top: 7,
                      left: 20,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textSk(context, "Sign Up", null, Colors.white,
                              FontWeight.bold, 42),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: Colors.white),
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: 485,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Text(
                                        "WELCOME!",
                                        style: TextStyle(
                                            fontSize: 42,
                                            color: Color(0xff0D3737)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "Login To Your Acount",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xff0D3737)),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: _text.textField1(
                                          null,
                                          "assets/userimage.png",
                                          Colors.white,
                                          true,
                                          "Username",
                                          30),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: _text.textField1(
                                          _text.validatorEmail(),
                                          "assets/userimage.png",
                                          Colors.white,
                                          true,
                                          "Email",
                                          30),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: _text.textField1(
                                          _text.validatorPasword(),
                                          "assets/userimage.png",
                                          Colors.white,
                                          true,
                                          "Password",
                                          30),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: _text.textField1(
                                          _text.validatorPasword(),
                                          "assets/password.png",
                                          Colors.white,
                                          true,
                                          "confirm Password",
                                          30),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    buttonSk(context, 40, 120,"REGISTRATION", 12,Color(0xffD7A700),3,BorderRadius.circular(12),),
                                    // SizedBox(
                                    //     height: 40,
                                    //     width: 100,
                                    //     child: ElevatedButton(onPressed: (){},
                                    //     child:Text("REGISTER",style: TextStyle(fontSize:13),),style: ElevatedButton.styleFrom(
                                    //         primary: Color(0xffD7A700),
                                    //         elevation: 3,
                                    //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),)
                                    //     ),),
                                    // ),
                                    // InkWell(
                                    //   child: Container(
                                    //     width:
                                    //         MediaQuery.of(context).size.width *
                                    //             0.25,
                                    //     height: 40,
                                    //     decoration: BoxDecoration(
                                    //         borderRadius:
                                    //             BorderRadius.circular(10),
                                    //         gradient: const LinearGradient(
                                    //             begin: Alignment.topCenter,
                                    //             end: Alignment.bottomCenter,
                                    //             colors: [
                                    //               Color(0xffD7A700),
                                    //               Color(0xffD7A700)
                                    //             ])),
                                    //     child: const Center(
                                    //       child: Text("LOGIN",
                                    //           style: TextStyle(
                                    //               color: Colors.white,
                                    //               fontSize: 18,
                                    //               fontWeight: FontWeight.w900)),
                                    //     ),
                                    //   ),
                                    //   onTap: () {
                                    //     Navigator.push(
                                    //       context,
                                    //       MaterialPageRoute(
                                    //           builder: (context) =>
                                    //               ShopRegistration()),
                                    //     );
                                    //   },
                                    // ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    const Center(
                                      child: Text(
                                        "Forget Password?",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black38),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  color: Colors.white,
                                  height: 1,
                                  width: 100,
                                ),
                                const Text(
                                  "or Login with",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  color: Colors.white,
                                  height: 1,
                                  width: 100,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 70, top: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                    onTap: () {
                                      //signInWithGoogle();
                                    },
                                    child: Image.asset(
                                      "assets/google.png",
                                      scale: 4,
                                    )),
                                SizedBox(
                                  width:MediaQuery.of(context).size.width * 0.150,
                                ),
                                InkWell(
                                    onTap: () {
                                      // FacebookLogin();
                                    },
                                    child: Image.asset( "assets/facebook.png", scale: 4,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      )),
                ]),
              ]),
              Positioned(
                  top: MediaQuery.of(context).size.height * 0.04,
                  right: MediaQuery.of(context).size.height * 0.04,
                  child: containerSk(context, 100, 110, Colors.white,BorderRadius.circular(100), null,imageSk("assets/signinlogo.png",3, BoxFit.none),
                  ))
            ],
          ),
        ]),
      ),
    ));
  }
}
