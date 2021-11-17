import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:hairfixxer_shopkeeper/base.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/sk_sign_up.dart';
import 'package:hairfixxer_shopkeeper/widget/container_widget.dart';
import 'package:hairfixxer_shopkeeper/widget/text_widget.dart';
import 'package:hairfixxer_shopkeeper/widget/textfield_widget.dart';
import 'package:provider/provider.dart';

import '../auth/googlesigninprovider.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),

      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SingleChildScrollView(
          child: Column(children: [
            Stack(
              children: [
                Column(children: [
                  Stack(
                    children: [
                      Container(
                        color: Colors.white,
                        height: MediaQuery.of(context).size.height * 0.150,
                        width: MediaQuery.of(context).size.width * 1,
                      ),
                    ],
                  ),
                  Stack(children: [
                    Container(
                        height:700,
                        width: double.infinity,
                        child: Image.asset(
                          "assets/screen.png",
                          fit: BoxFit.cover,
                        )),
                    Positioned(
                        top: 45,
                        left: 20,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sign In",
                              style: TextStyle(
                                  fontSize: 42,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Colors.white),
                                width: MediaQuery.of(context).size.width * 0.9,
                                height: MediaQuery.of(context).size.height * 0.470,
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
                                      ),Padding(padding:EdgeInsets.all(8),
                                      child:Field(controller: emailController, labelText:"email",
                                          path:"assets/userimage.png", obsecureText:false, eye: false),),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Padding(padding: EdgeInsets.all(8),
                                      child: Field(controller: passwordController,labelText: "password",eye: true,obsecureText: true, path:'assets/password.png',),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width * 0.25,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Color(0xffD7A700),
                                                  Color(0xffD7A700)
                                                ])),
                                        child: Center(
                                          child: Text("LOGIN",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w900)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Center(
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
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 120,
                              width: MediaQuery.of(context).size.width*0.9,
                              color: Colors.transparent,
                              child:Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Container(
                                            color: Colors.white,
                                            height: 1,
                                            width: 80,
                                          ),
                                          Text(
                                            "or Login with",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            color: Colors.white,
                                            height: 1,
                                            width: 80,
                                          ),
                                        ],
                                      ),
                                    SizedBox(height: 10,),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          InkWell(
                                              onTap: () {
                                                final provider =
                                                Provider.of<GoogleSignInProvider>(
                                                    context,
                                                    listen: false);
                                                provider.googleLogin();
                                               // signInWithGoogle();
                                              },
                                              child: Image.asset(
                                                "assets/google.png",
                                                scale: 4,
                                              )),
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width *
                                                0.100,
                                          ),
                                          InkWell(
                                              onTap: () {
                                                // FacebookLogin();
                                              },
                                              child: Image.asset(
                                                "assets/facebook.png",
                                                scale: 4,
                                              )),
                                        ],
                                      ),
                                 SizedBox(height: 10,),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Don't have an acount?",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.of(context).pushReplacement(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SignUpScreen()));
                                            },
                                            child:textSk(context,"Register",TextAlign.center,Color(0xff204849),FontWeight.bold
                                                ,20),
                                          ),
                                        ],
                                      ),
                                  ],
                                )
                              ),

                            )

                          ],
                        )),
                  ]),
                ]),
                Positioned(
                  top: 20,
                  right: MediaQuery.of(context).size.width*0.210,
                  child: containerSk(context,110,200,Colors.white,BorderRadius.circular(30),null,
                        imageSk("assets/logo 1.png",4,BoxFit.none)),

               ),
              ],
            ),
          ]),
        ),
      ));
}
// Center(
// child: Text("Forget Password?",style:TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color:
// Colors.black38),),
// ),
