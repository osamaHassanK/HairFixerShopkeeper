import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hairfixxer_shopkeeper/base.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/container_widget.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/text_widget.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/textfield_widget.dart';

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
              imageSk("assets/scissor1.png",3,BoxFit.none),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  textSk(context,"Hair",null,Color(0xffB97B00),FontWeight.w600,46),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                  textSk(context,"Fixerr",null,Color(0xffDDB000),FontWeight.w600,46),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    textSk(context,"    WELCOME!",TextAlign.start,Colors.black87,FontWeight.w400,36),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child:
                textSk(context,"Reset your password",null,Colors.black87,FontWeight.w400,16),),
              SizedBox(
                height: 30,
              ),
              textSk(context,"Reset Link will be sent to your email id !",null,Colors.black54,FontWeight.w400,16),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Field(controller: _emailController, labelText: "Email", path: "assets/userimage.png",eye: false, obsecureText: false,),
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
                        child:containerSk(context,42,120,Color(0xffD6A600),BorderRadius.circular(12),
                            Padding(padding: EdgeInsets.all(8),child:
                            textSk(context,"Reset",TextAlign.center,Colors.white,FontWeight.w600,18) ,))
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          textSk(context,"Dont Have an account?",null,Colors.black,FontWeight.w600,15),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context, '/signUp');
                            },
                            child:
                            textSk(context, " REGISTER",null,Color(0xffD6A600),FontWeight.w600,15),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          textSk(context, "Have an acount?",null,Colors.black,FontWeight.w600,15),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child:
                            textSk(context, " LOGIN",null,Color(0xffD6A600),FontWeight.w600,15),
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