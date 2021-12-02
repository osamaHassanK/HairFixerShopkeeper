
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hairfixxer_shopkeeper/base.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/bottomnavigatorbar.dart';
import 'package:hairfixxer_shopkeeper/shop%20creation%20pages/catlog_for_beared.dart';
import 'package:hairfixxer_shopkeeper/widget/text_widget.dart';
import 'package:hairfixxer_shopkeeper/widget/textfield_widget.dart';
import 'package:hairfixxer_shopkeeper/widget/top_icon&title.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';

class Catalog1 extends StatefulWidget {
  const Catalog1({Key? key}) : super(key: key);



  @override
  _Catalog1State createState() => _Catalog1State();
}

class _Catalog1State extends State<Catalog1> {
  TextField1 textF = TextField1();
  var _image;


  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:SingleChildScrollView(
          child: Column(
            children: [
              topIcon(context,"backarrow.png","setting.png",4,BottomNavigatorBar()),
              topTitle(context, "Create your Catalog"),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children:[
                        textSk(context,"Hair Style Catalog",TextAlign.center,Colors.black,FontWeight.bold,23),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        textSk(context,"Name",TextAlign.start,Colors.black,FontWeight.normal,16),
                      ],
                    ),
                    SizedBox(height: 10,),
                    textFieldN("e.g Circle Beared",true),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: const [ Text("Description",
                        style: TextStyle(fontSize: 16,color: Colors.black),)],
                    ),
                    SizedBox(height: 10,),
                    textFieldN("e.g HC 8987",true),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [ Text("Image",style: TextStyle(fontSize: 16,color: Colors.black),)],
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(

                          child: Text('+ Add ',style: TextStyle(fontSize: 18),),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xffD7A700),
                            onPrimary: Colors.white,
                            shape: const BeveledRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5))),
                          ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Catalog2()),
                              );
                            },
                        ),
                        ElevatedButton(
                          child: Text(' Done ',style: TextStyle(fontSize: 18),),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xffD7A700),
                            onPrimary: Colors.white,
                            shape: const BeveledRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5))),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
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
