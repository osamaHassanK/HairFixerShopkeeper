import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:hairfixxer_shopkeeper/base.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/shop_registration.dart';
import 'package:hairfixxer_shopkeeper/widget/container_widget.dart';
import 'package:hairfixxer_shopkeeper/widget/text_widget.dart';
import 'package:hairfixxer_shopkeeper/widget/textfield_widget.dart';

class SignUpScreen extends StatelessWidget {
  TextField1 _text = TextField1();
  TextEditingController emailController = new TextEditingController();
  TextEditingController userController = new TextEditingController();
  TextEditingController passwordController0 = new TextEditingController();
  TextEditingController passwordController1 = new TextEditingController();
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
                        BorderRadius.circular(0), null),
                  ],
                ),
                Stack(children: [
                  containerSk(context, 700, double.infinity, Colors.white,BorderRadius.circular(0),
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
                            child:containerSk(context,510,MediaQuery.of(context).size.width*0.9,Colors.white,BorderRadius.circular(20), Column(
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
                                    child: Field(obsecureText: false,eye: false,labelText: "Username",
                                      controller:userController,path:"assets/userimage.png",),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:Field(labelText: "Email",eye: false,obsecureText: false,controller: emailController,
                                      path: "assets/emailicon.png",),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:Field(path: "assets/password.png",controller: passwordController0,obsecureText: true,
                                        eye: true,labelText: "password",)
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Field(path: "assets/password.png",controller: passwordController1,obsecureText: true,
                                        eye: true,labelText: "Confirm password",)
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
                                      child:containerSk(context,40,120,Color(0xffD7A700),BorderRadius.circular(10),
                                        Center(child: textSk(context,"REGISTRATION",TextAlign.center,Colors.white,FontWeight.normal,14)),)),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Center(
                                    child:textSk(context,"ForgetPassword",TextAlign.center,Colors.black38,FontWeight.normal,15),
                                  )
                                ],
                              ),),
                          ),
                          SizedBox(height: 10,),
                         Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
                                 SizedBox(
                                   width:MediaQuery.of(context).size.width*0.060,
                                 ),
                                 Container(
                                   color: Colors.white,
                                   height: 1,
                                   width: 100,
                                 ),
                                 textSk(context,"or login with",TextAlign.center,Colors.white,null,16),
                                 Container(
                                   color: Colors.white,
                                   height: 1,
                                   width: 100,
                                 ),
                               ],
                             ),

                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                   SizedBox(
                                     width: MediaQuery.of(context).size.width/4,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        //signInWithGoogle();
                                      },
                                      child:imageSk("assets/google.png",4, BoxFit.none)
                                  ),
                                  SizedBox(
                                    width:MediaQuery.of(context).size.width * 0.100,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      // FacebookLogin();
                                    },
                                    child:imageSk("assets/facebook.png",4,BoxFit.none),),
                                ],
                              ),
                        ],
                      )),
                ]),
              ]),
              Positioned(
                  top: MediaQuery.of(context).size.height * 0.04,
                  right: MediaQuery.of(context).size.height * 0.04,
                  child: containerSk(context, 100, 110, Colors.white,BorderRadius.circular(100),imageSk("assets/signinlogo.png",3, BoxFit.none),
                  ))
            ],
          ),
        ]),
      ),
    ));
  }
}
