import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:hairfixxer_shopkeeper/auth/facebook_auth.dart';
import 'package:hairfixxer_shopkeeper/auth/forget_passwword.dart';
import 'package:hairfixxer_shopkeeper/auth/with_email/sign_in.dart';
import 'package:hairfixxer_shopkeeper/base.dart';
import 'package:hairfixxer_shopkeeper/Utilities/Responsive.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/signup_screen.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/MyContainer.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/container_widget.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/text_widget.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/textfield_widget.dart';
import 'package:provider/provider.dart';

import '../auth/googlesigninprovider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  var password = "";
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SignInWithEmail signInWithEmail =
        SignInWithEmail(email: email, password: password);
    return SafeArea(
        child: SingleChildScrollView(
            child: Material(
      child: Container(
        height: 800,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Column(children: [
              myContainer(
                context: context,
                color: Colors.white,
                height: 0.150,
                width: 1,
              ),
              Expanded(
                child: Stack(children: [
                  Container(
                      width: double.infinity,
                      child: Image.asset(
                        "assets/screen.png",
                        fit: BoxFit.cover,
                      )),
                  Positioned(
                    top: 45,
                    left: 20,
                    right: 20,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textSk(context, "Sign In", TextAlign.center,
                              Colors.white, FontWeight.bold, 42),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: myUnResponsiveContainer(
                              radiusValue: 20,
                              context: context,
                              height: 350,
                              width:Responsive.responsiveWidth(context, value: 1),
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: textSk(
                                        context,
                                        "WELCOME!",
                                        TextAlign.center,
                                        Color(0xff0D3737),
                                        null,
                                        40),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  textSk(
                                      context,
                                      "Login To Your Account",
                                      TextAlign.center,
                                      Color(0xff0D3737),
                                      null,
                                      20),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Field(
                                        controller: emailController,
                                        labelText: "email",
                                        path: "assets/userimage.png",
                                        obsecureText: false,
                                        eye: false),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Field(
                                      controller: passwordController,
                                      labelText: "password",
                                      eye: true,
                                      obsecureText: true,
                                      path: 'assets/password.png',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if (_formKey.currentState!.validate()) {
                                        setState(() {
                                          email = emailController.text;
                                          password = passwordController.text;
                                        });
                                        signInWithEmail. userLogin(context);
                                      }
                                    },
                                    child: containerSk(
                                      context,
                                      40,
                                      MediaQuery.of(context).size.width * 0.25,
                                      Color(0xffD7A700),
                                      BorderRadius.circular(10),
                                      Padding(
                                          padding: EdgeInsets.all(5),
                                          child: textSk(
                                              context,
                                              "LOGIN",
                                              TextAlign.center,
                                              Colors.white,
                                              FontWeight.w900,
                                              18)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ForgetPassword()));
                                    },
                                    child: Center(
                                      child: textSk(
                                          context,
                                          "Forget Password?",
                                          TextAlign.center,
                                          Colors.black38,
                                          FontWeight.bold,
                                          15),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    color: Colors.white,
                                    height: 1,
                                    width: 80,
                                  ),
                                  textSk(context, "or login with", null,
                                      Colors.white, FontWeight.bold, 17),
                                  Container(
                                    color: Colors.white,
                                    height: 1,
                                    width: 80,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
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
                                        provider.googleLogin(context);
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
                                      onTap: () async {
                                        await signInWithFacebook();
                                        Navigator.pushNamed(
                                            context, '/homePage');
                                      },
                                      child: Image.asset(
                                        "assets/facebook.png",
                                        scale: 4,
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: Responsive.responsiveWidth(context,
                                        value: 0.5),
                                    child: const Text(
                                      "Don't have an acount?",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SignUpScreen()));
                                    },
                                    child: Container(
                                      child: textSk(
                                          context,
                                          "Register",
                                          TextAlign.center,
                                          Color(0xff204849),
                                          FontWeight.bold,
                                          20),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ))
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ]),
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: Align(
                alignment: Alignment.topCenter,
                child: containerSk(
                    context,
                    110,
                    200,
                    Colors.white,
                    BorderRadius.circular(30),
                    imageSk("assets/logo 1.png", 4, BoxFit.none)),
              ),
            ),
          ],
        ),
      ),
    )));
  }
}

// Center(
// child: Text("Forget Password?",style:TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color:
// Colors.black38),),
// ),
