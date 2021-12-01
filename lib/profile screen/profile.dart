import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hairfixxer_shopkeeper/auth/change_password.dart';
import 'package:hairfixxer_shopkeeper/auth/googlesigninprovider.dart';
import 'package:hairfixxer_shopkeeper/profile%20screen/privacy.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/sk_login.dart';
import 'package:hairfixxer_shopkeeper/widget/top_icon&title.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'FAQ.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? _image;
  final picker = ImagePicker();

  Future fromCamera() async {
    final pickedImage = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        print("No Image Selected");
      }
    });
  }

  Future fromGallery() async {
    final pickedImage = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        print("No Image Selected");
      }
    });
  }
  final storage = new FlutterSecureStorage();
  final email=FirebaseAuth.instance.currentUser!.email;
  final name=FirebaseAuth.instance.currentUser!.displayName;
  final pic=FirebaseAuth.instance.currentUser!.photoURL;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              topIcon(context,"backarrow.png","home.png",4),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(color: Color(0xffD5A300)),
                child: Center(
                    child: Text(
                      "Profile",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              Stack(
                children: [
                  Center(
                    child: Container(
                      width: 180,
                      height: 130,
                      color: Colors.transparent,
                    ),
                  ),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.black12,
                        ),
                        width: 130,
                        height: 130,
                        child: pic == null
                            ? Center(
                            child: 
                            Text("No Image Select",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black54)))
                            : Image.network("$pic",fit: BoxFit.cover,)
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 5,
                      right: 90,
                      child: RawMaterialButton(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.add_a_photo,
                              size: 25,
                              color: Colors.white70,
                            ),
                          ),
                          fillColor: Color(0xffD5A300),
                          shape: CircleBorder(),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                      "Choose options",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: [
                                          InkWell(
                                            onTap: () => fromGallery(),
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.image,
                                                    color: Color(0xffD5A300),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        left: 10),
                                                    child: Text(
                                                      "Gallery",
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () => fromCamera(),
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.camera,
                                                    color: Color(0xffD5A300),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        left: 10),
                                                    child: Text(
                                                      "Camera",
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          }))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "$name",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
              ),
              Text("$email"),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.black38,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => Privacy()),
                                (route) => false);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(
                              "Privacy",
                              style: TextStyle(
                                  fontSize: 19, color: Colors.black54),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.black38,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => FAQ()),
                                (route) => false);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(
                              "FAQ",
                              style: TextStyle(fontSize: 19, color: Colors.black54),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.black38,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(
                              "Settings",
                              style: TextStyle(fontSize: 19, color: Colors.black54),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.black38,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(
                              "Feedback",
                              style: TextStyle(fontSize: 19, color: Colors.black54),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.black38,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => ChangePassword(password: null)),
                                (route) => false);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(
                              "Change Password",
                              style: TextStyle(fontSize: 19, color: Colors.black54),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.black38,
                    ),
                  ],
                ),
              ),
              Center(
                child: SizedBox(
                  width: 120,
                  height: 40,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffD5A300),
                        shape: RoundedRectangleBorder(
                          //to set border radius to button
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () async{
                        await FirebaseAuth.instance.signOut();
                        await storage.delete(key: "uid");
                        try {
                          final provider = Provider.of<GoogleSignInProvider>(
                              context,
                              listen: false);
                          provider.logout();
                        } catch (e) {
                          print("error");
                        }
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (builder) => LoginScreen()),
                                (route) => false);
                      },
                      child: Text(
                        "Logout",
                        style: TextStyle(fontSize: 18),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}