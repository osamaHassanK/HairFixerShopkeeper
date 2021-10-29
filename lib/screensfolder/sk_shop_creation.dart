import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';

import 'catlog_for_hair.dart';

class ShopRegistrationForm extends StatefulWidget {
  const ShopRegistrationForm({Key? key}) : super(key: key);

  @override
  State<ShopRegistrationForm> createState() => _ShopRegistrationFormState();
}

var height = "MediaQuery.of(context).size.height";
var width = "MediaQuery.of(context).size.height";

class _ShopRegistrationFormState extends State<ShopRegistrationForm> {
  var _image;


  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Positioned(
                        top: MediaQuery.of(context).size.height * 0.370,
                        left: MediaQuery.of(context).size.width * 0.280,
                        child: Image.asset(
                          "assets/logoshopregistration.png",
                          scale: 3.4,
                        )),
                    Positioned(
                      top: 10,
                      left: 5,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child:
                        Image.asset("assets/backarrow.png",scale: 4,),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 5,
                      child: Image.asset("assets/settingicon.png",scale: 4,),
                    ),

                    Column(
                      children: [
                        const SizedBox(
                          height: 35,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/profilepic.png",
                              scale: 5,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Hello,",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffD7A600),
                              ),
                            ),
                            Text(
                              "Hamza",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: Color(0xffD7A600),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Registered your Shop",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff474747),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: const [
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "1. Enter your Shop Name",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 30, right: 30, bottom: 10),
                          child: TextFormField(
                              decoration: InputDecoration(
                                labelText: "e.g Men’s Beauty Salon",
                                filled: true,
                                fillColor: Color(0xffF6F6F6),
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 6.0, top: 8.0),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(10)),
                              )),
                        ),
                        Row(
                          children: const [
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "2. Enter your Shop Address",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black, //(0xff474747),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 30, right: 30),
                          child:
                          TextFormField(
                              decoration: InputDecoration(
                                labelText: "Enter your shop address",
                                filled: true,
                                fillColor: Color(0xffF6F6F6),
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 6.0, top: 8.0),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            children: const [
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "3. Upload your Image",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black, //(0xff474747),
                                ),
                              ),
                            ],
                          ),
                        ),
                  Padding(padding: EdgeInsets.all(12),
                    child:Container(
                        color: Colors.transparent,
                        width: double.infinity,
                        height: 200,
                        child:Stack(
                          children: [
                            Center(
                              child:  ElevatedButton(
                                onPressed: () => getImage(ImgSource.Gallery),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                ),
                                child: Text(
                                  "Upload Image".toUpperCase(),
                                  style: TextStyle(color: Colors.transparent),
                                ),
                              ),
                            ),
                            Center(
                              child:
                              _image != null ? Image.file(File(_image.path),) : Container(),
                            ),


                          ],
                        )

                    ),
                  ),


                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            children: const [
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "3. Enter Opening and Closing Timing",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff474747),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 22,
                              ),
                              Container(
                                width: 120,
                                height: 32,
                                child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "10 AM",
                                      filled: true,
                                      fillColor: Color(0xffF6F6F6),
                                      contentPadding: const EdgeInsets.only(
                                          left: 14.0, bottom: 6.0, top: 8.0),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xffF6F6F6),
                                        ),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                    )),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 19, left: 19),
                                child: Text(
                                  "To",
                                  style: TextStyle(fontSize: 18.5),
                                ),
                              ),
                              Container(
                                width: 120,
                                height: 32,
                                child: TextFormField(
                                    decoration: InputDecoration(
                                      alignLabelWithHint: false,
                                      labelText: "11 PM",
                                      filled: true,
                                      fillColor: Color(0xffF6F6F6),
                                      contentPadding: const EdgeInsets.only(
                                          left: 14.0, bottom: 6.0, top: 8.0),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xffF6F6F6),
                                        ),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: SizedBox(
                            width: 120,
                            height: 48,
                            child:
                            ElevatedButton(
                              child: Text(' Done ',style: TextStyle(fontSize: 19),),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffD7A700),
                                onPrimary: Colors.white,
                                shape: const BeveledRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5))),
                              ),
                              onPressed: () {
                                showDialog(context: context, builder: (context){
                                  return AlertDialog(
                                    title: Text("Congratulation",style: TextStyle(color: Color(0xffD7A700)),
                                      textAlign: TextAlign.center,),
                                    content: Text("Your Shop has been Registered successfully"),
                                    actions: <Widget>[
                                      Center(
                                        child: ElevatedButton(
                                            onPressed: (){
                                              Navigator.of(context).pushReplacement(
                                                  MaterialPageRoute(builder: (context)=> Catalog1(),));

                                            }, child:Text("close")),
                                      ),
                                    ],
                                  );
                                });
                              },
                            ),
                          ),
                        )

                      ],
                    ),
          ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future getImage(ImgSource source) async {
    var image = await ImagePickerGC.pickImage(
        enableCloseButton: true,
        closeIcon: Icon(
          Icons.close,
          color: Colors.red,
          size: 12,
        ),
        context: context,
        source: source,
        barrierDismissible: true,
        cameraIcon: Icon(
          Icons.camera_alt,
          color: Colors.red,
        ), //cameraIcon and galleryIcon can change. If no icon provided default icon will be present
        cameraText: Text(
          "From Camera",
          style: TextStyle(color: Colors.red),
        ),
        galleryText: Text(
          "From Gallery",
          style: TextStyle(color: Colors.blue),
        ));
    setState(() {
      _image = image;
    });
  }
}