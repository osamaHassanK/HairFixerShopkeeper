import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hairfixxer_shopkeeper/base.dart';
import 'package:hairfixxer_shopkeeper/widget/container_widget.dart';
import 'package:hairfixxer_shopkeeper/widget/text_widget.dart';
import 'package:hairfixxer_shopkeeper/widget/textfield_widget.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override

  TextEditingController _emailController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var email="";


  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    super.dispose();
  }

  resetPassword() async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 7),
          backgroundColor: Colors.orangeAccent,
          content: Text(
            "Note: Email has been sent now you can change your password\nPlease Login with new password",
            style: TextStyle(fontSize: 16),
          )));
    }on FirebaseException catch(e){
      if(e.code=='user-not-found'){
        print("No user found for that Email");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "No user found for that Email",
              style: TextStyle(fontSize: 16),
            )));
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              imageSk("assets/scissor1.png",4,BoxFit.none),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textSk(context,"Hair",null,Color(0xff056EB7),FontWeight.w600,46),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                  textSk(context,"Fixerr",null,Color(0xff0EA0F8),FontWeight.w600,46),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textSk(context,"WELCOME!",null,Colors.black54,FontWeight.w400,36),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child:
                textSk(context,"Reset your password",null,Colors.black54,FontWeight.w400,36),),
              SizedBox(
                height: 30,
              ),
              textSk(context,"Reset Link will be sent to your email id !",null,Colors.black54,FontWeight.w400,16),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Field(controller: _emailController, labelText: "Email", path: "username.png",eye: false, obsecureText: false,),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                        onTap: () {
                          if(_formKey.currentState!.validate()){
                            setState(() {
                              email=_emailController.text;
                            });
                            resetPassword();
                          }
                        },
                        child:containerSk(context,120,42,Colors.amber,BorderRadius.circular(12),null)
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          textSk(context,"Dont Have an account?",null,Colors.black26,FontWeight.w600,15),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context, '/signUp');
                            },
                            child:
                            textSk(context, "REGISTER",null,Color(0xff0EA1F8),FontWeight.w600,15),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          textSk(context, "Have an acount?",null,Colors.black26,FontWeight.w600,15),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context, '/signIn');
                            },
                            child:
                            textSk(context, "LOGIN",null,Color(0xff0EA1F8),FontWeight.w600,15),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}