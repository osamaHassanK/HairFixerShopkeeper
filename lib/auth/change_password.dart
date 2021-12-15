import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hairfixxer_shopkeeper/profile%20screen/profile.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/login_screen.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/container_widget.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/text_widget.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/textfield_widget.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/top_icon&title.dart';


class ChangePassword extends StatefulWidget {
  ChangePassword({Key? key,required this.password}) : super(key: key);

  var password;
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  var currentPassword;
  var newPassword;
  var confirmPassword;
  // @override
  // void initState() {
  //   getData();
  // }
  // getData() async{
  //   SharedPreferences preferences=await SharedPreferences.getInstance();
  //   setState(() {
  //     my_custom_widgets.password=preferences.getString('currentPassword');
  //   });
  // }

  TextEditingController _currentPassword = new TextEditingController();
  TextEditingController _newPassword = new TextEditingController();
  TextEditingController _confirmPassword = new TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _newPassword.dispose();
    super.dispose();
  }

  final currentUser = FirebaseAuth.instance.currentUser;
  changePassword() async {
    if (newPassword == confirmPassword) {
      try {
        await currentUser!.updatePassword(newPassword);
        FirebaseAuth.instance.signOut();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text("Your password has been changed.. Login again !",style: TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.w500),)));
      } on FirebaseException catch (e) {
        if (e.code == 'weak-password') {
          print("Password provided is to weak");
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Password provided is to weak",
                style: TextStyle(fontSize: 16),
              )));
        }
      }
    } else {
      print("password or confirm password does not match");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            "password or confirm password does not match",
            style: TextStyle(fontSize: 18),
          )));
    }
  }
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                topIcon(context,"backarrow.png","home.png", 4,Profile()),
                topTitle(context, "Change Password"),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Field(controller: _currentPassword, labelText: "Current Password", path: "assets/password.png", obsecureText: true, eye: true)),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Field(
                    controller: _newPassword, labelText: "New Password", path: "assets/password.png", eye: true, obsecureText: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Field(
                    controller: _confirmPassword, labelText: "Confirm Password", path: "assets/password.png", eye: true, obsecureText:true,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                    onTap: () async {
                      if(_formKey.currentState!.validate()){
                        setState(() {
                          currentPassword=_currentPassword.text;
                          newPassword=_newPassword.text;
                          confirmPassword=_confirmPassword.text;
                        });
                        changePassword();
                        // SharedPreferences preferences=await SharedPreferences.getInstance();
                        // preferences.setString('currentPassword', widget.password);
                        // print(widget.password);

                      }
                    },
                    child: containerSk(context,45,100,Color(0xffD6A600),BorderRadius.circular(12),
                    Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: textSk(context,"Done",TextAlign.center,Colors.white,FontWeight.w600,20),
                    ))
                    // button(context, "DONE", 100, 45, 10, 17,  FontWeight.w800)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
