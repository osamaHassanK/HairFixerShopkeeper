import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:hairfixxer_shopkeeper/base.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/shop_registration.dart';
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
                  Positioned(
                      top: 7,
                      left: 20,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textSk(context, "Sign Up", null, Colors.white,FontWeight.bold, 42),
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
                                    Padding( padding: EdgeInsets.only(top: 10),
                                      child:textSk(context,"WELCOME!",TextAlign.center,Color(0xff0D3737),null,42),
                                    ),
                                    SizedBox(height: 2,),
                                    textSk(context,"Login To Your Acount",TextAlign.center,Color(0xff0D3737),null,20),
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
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ShopRegistration()));
                                      },
                                      child:containerSk(context,40,120,Color(0xffD7A700),BorderRadius.circular(10),null,
                                          Center(child: textSk(context,"REGISTRATION",TextAlign.center,Colors.white,FontWeight.normal,12)),)),
                                      //buttonSk(context, 40, 120,"REGISTRATION", 12,Color(0xffD7A700),3,BorderRadius.circular(12),)),
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
                                textSk(context,"or login with",TextAlign.center,Colors.white,null,15),
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
                                    child:imageSk("assets/google.png",4, BoxFit.none)
                         ),
                                SizedBox(
                                  width:MediaQuery.of(context).size.width * 0.150,
                                ),
                                InkWell(
                                    onTap: () {
                                      // FacebookLogin();
                                    },
                                    child:imageSk("assets/facebook.png",4,BoxFit.none),),
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
