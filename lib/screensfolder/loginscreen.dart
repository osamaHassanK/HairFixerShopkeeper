import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                Column(children: [
                  Stack(
                    children: [
                      Container(
                        color: Colors.white,
                        height: MediaQuery.of(context).size.height * 0.170,
                        width: MediaQuery.of(context).size.width * 1,
                      ),
                    ],
                  ),
                  Stack(children: [
                    Container(
                        height: MediaQuery.of(context).size.height * 0.790,
                        width: double.infinity,
                        child: Image.asset(
                          "assets/screen.png",
                          fit: BoxFit.cover,
                        )),
                    Positioned(
                        top: 42,
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
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  color: Colors.white
                                ),
                                width: MediaQuery.of(context).size.width*0.9,
                                height:MediaQuery.of(context).size.height*0.470,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Text("WELCOME!",style: TextStyle(fontSize: 42,
                                            color:Color(0xff0D3737)),),
                                      ),
                                      SizedBox(height: 2,),
                                      Text("Login To Your Acount",style: TextStyle(fontSize: 20,
                                          color:Color(0xff0D3737)),),
                                      SizedBox(height: 5,),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(30),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black26.withOpacity(0.1),
                                                  blurRadius: 1,
                                                  offset: const Offset(0, 4))
                                            ],),
                                          child: TextFormField(
                                            validator: (val) {
                                              if (val!.isEmpty) {
                                                return "Please enter your email";
                                              } else if (!val.contains('@')) {
                                                return ("Please enter a valid email");
                                              }
                                              return null;
                                            },
                                            // controller: _emailController,
                                            decoration: InputDecoration(
                                              prefixIcon: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 25, top: 12, bottom: 12, right: 20),
                                                child: Image.asset(
                                                  'assets/userimage.png',
                                                  scale: 4,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              fillColor: Colors.white,
                                              filled: true,
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.transparent),
                                                  borderRadius: BorderRadius.circular(30)),
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(30)),
                                              labelText: 'Username',
                                              labelStyle: TextStyle(
                                                  color: Colors.black12,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 7,),

                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(boxShadow: [
                                            BoxShadow(
                                                color: Colors.black26.withOpacity(0.1),
                                                blurRadius: 1,
                                                offset: const Offset(0, 4))
                                          ], borderRadius: BorderRadius.circular(30)),
                                          child: TextFormField (
                                            // obscureText: isHiddenPassword,
                                            validator: (val) {
                                              if (val!.isEmpty) {
                                                return "Please enter a password";
                                              }
                                              if (val.length < 6) {
                                                return "Please enter atleast 6 char";
                                              }
                                            },
                                            // controller: _passwordController,
                                            decoration: InputDecoration(
                                                prefixIcon: Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 25, top: 12, bottom: 12, right: 20),
                                                  child: Image.asset(
                                                    'assets/password.png',
                                                    scale: 5,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                fillColor: Colors.white,
                                                filled: true,
                                                enabledBorder: OutlineInputBorder(
                                                    borderSide:
                                                    BorderSide(color: Colors.transparent),
                                                    borderRadius: BorderRadius.circular(30)),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(30)),
                                                labelText: 'Password',
                                                labelStyle: TextStyle(
                                                    color: Colors.black12,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                                suffixIcon: Padding(
                                                  padding: const EdgeInsets.only(right: 20),
                                                  child: InkWell(
                                                      onTap: (){},
                                                      child: Icon(
                                                        Icons.visibility,
                                                      )),
                                                )),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.25,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
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
                                        child: Text("Forget Password?",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color:
                                        Colors.black38),),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Container(
                                    color: Colors.white,
                                    height:1,
                                    width: 80,
                                  ),
                                  Text("or Login with",
                                    style:
                                    TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                                  Container(
                                    color: Colors.white,
                                    height:1,
                                    width: 80,
                                  ),
                                ],

                              ),
                            ),Padding(
                              padding: const EdgeInsets.only(left: 80,top: 10),
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
                                    width: MediaQuery.of(context).size.width * 0.150,
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
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 38,top: 10),
                              child: Row(
                                  children: [
                                    Text("Don't have an acount?",
                                      style:
                                      TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                                    Text(" Register",
                                      style:
                                      TextStyle(color: Color(0xff204849),fontSize: 20,fontWeight: FontWeight.bold),),

                                  ],
                                ),
                            ),

                          ],
                        )),

                ]),
              ]),
                Positioned(
                  top: 30,
                  left: 90
                  ,child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Image.asset(
                    "assets/logo 1.png",
                    scale: 4,
                  ),
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.170,
                ),),

              ],
          ),
        ]),
      ),
    ));
  }
}
// Center(
// child: Text("Forget Password?",style:TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color:
// Colors.black38),),
// ),