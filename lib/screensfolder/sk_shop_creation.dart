import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/widget.dart';
import 'package:hairfixxer_shopkeeper/widget/container_widget.dart';
import 'package:hairfixxer_shopkeeper/widget/text_widget.dart';
import 'package:hairfixxer_shopkeeper/widget/textfield_widget.dart';

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
    return SafeArea(
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
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Image.asset(
                          "assets/backarrow.png",
                          scale: 4,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 5,
                      child: Image.asset(
                        "assets/settingicon.png",
                        scale: 4,
                      ),
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
                          children: [
                            textSk(context, "hello,", TextAlign.center,
                                Color(0xffD7A600), FontWeight.w400, 22),
                            textSk(context, "Hamza", TextAlign.start,
                                Color(0xffD7A600), FontWeight.w700, 22),
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        textSk(context, "Registered your Shop",
                            TextAlign.center, Color(0xff474747), null, 12),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 8,
                            ),
                            textSk(
                                context,
                                "1. Enter your Shop Name",
                                TextAlign.center,
                                Colors.black,
                                FontWeight.normal,
                                15),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 30, right: 30, bottom: 10),
                          child: textFieldN(
                            "e.g Men’s Beauty Salon",
                            true,
                          ),
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
                          child: textFieldN("Enter Your shop address", true),
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
                        Padding(
                          padding: EdgeInsets.all(12),
                          child:containerSk(context,200,double.infinity,Color(0xffF6F6F6),null,null,Stack(
                            children: [
                              Center(
                                  child: InkWell(
                                    onTap: () => getImage(ImgSource.Gallery),
                                    child: Container(
                                      child: Text("upload Image"),
                                      width: 100,
                                      height: 20,
                                    ),
                                  )),
                              Center(
                                child: _image != null
                                    ? Image.file(
                                  File(_image.path),
                                )
                                    : Container(),
                              ),
                            ],
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 8,
                              ),
                              textSk(
                                  context,
                                  "3. Enter Opening and Closing Timing",
                                  null,
                                  Color(0xff474747),
                                  null,18),
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
                              containerSk(context, 32, 120, Colors.transparent,
                                  null, null, textFieldN("10AM", true)),
                              const Padding(
                                padding: EdgeInsets.only(right: 19, left: 19),
                                child: Text(
                                  "To",
                                  style: TextStyle(fontSize: 18.5),
                                ),
                              ),
                              containerSk(context, 32, 120, Colors.transparent,
                                  null, null, textFieldN("11AM", true)),
                            ],
                          ),
                        ),
                       ShowDialogue(),
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
