import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/service.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';
import 'bottomnavigatorbar.dart';

class EditService extends StatefulWidget {
  const EditService({Key? key}) : super(key: key);

  @override
  _EditServiceState createState() => _EditServiceState();
}

class _EditServiceState extends State<EditService> {

  var _image;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body:SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 20, right: 20, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => Services()),
                                    (route) => true);
                          },
                          child: Image.asset(
                            "assets/backarrow.png",
                            scale: 4,
                          )),
                      InkWell(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => BottomNavigatorBar()),
                                  (route) => false);
                        },
                        child: Image.asset(
                          "assets/home.png",
                          scale: 4,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: 45,
                  decoration: BoxDecoration(color: Color(0xffD5A300)),
                  child: Center(
                    child: Text(
                      'Edit Services',
                      style: TextStyle(
                          color: Colors
                              .white,
                          fontSize:
                          20,
                          fontWeight:
                          FontWeight
                              .w800),
                    ),),
                ),
                Row(
                  children: const [
                    SizedBox(
                      width: 8,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0, right: 8, top: 8),
                      child: Text(
                        "Name",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 30, right: 30, bottom: 10),
                  child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Hair Cut',
                        labelStyle: TextStyle(fontSize: 13),
                        filled: true,
                        fillColor: Color(0xffF6F6F6),
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 6.0, top: 8.0),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.transparent)),

                      )),
                ),
                Row(
                  children: const [
                    SizedBox(
                      width: 8,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0, right: 8, top: 8),
                      child: Text(
                        "Price",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 30, right: 30, bottom: 10),
                  child: TextFormField(
                      decoration: InputDecoration(
                        labelText: '30\$',
                        labelStyle: TextStyle(fontSize: 13),
                        filled: true,
                        fillColor: Color(0xffF6F6F6),
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 6.0, top: 8.0),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.transparent)),

                      )),
                ),
                Row(
                  children: const [
                    SizedBox(
                      width: 8,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0, right: 8, top: 8),
                      child: Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 30, right: 30, bottom: 10),
                  child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Simple Hair Cut',
                        labelStyle: TextStyle(fontSize: 13),
                        filled: true,
                        fillColor: Color(0xffF6F6F6),
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 6.0, top: 8.0),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.transparent)),

                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 00, right: 30, bottom: 00, left: 10),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 8, top: 8),
                        child: Text(
                          "Image",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
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
                                  primary: Colors.white,elevation: 0

                              ),
                              child: Text(
                                "Upload Image".toUpperCase(),
                                style: TextStyle(color: Colors.black),
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

              ],
            ),
          )

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