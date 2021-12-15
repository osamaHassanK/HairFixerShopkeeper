import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/bottomnavigatorbar.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/top_icon&title.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';
import 'catalog_for_facial.dart';
class Catalog2 extends StatefulWidget {
  const Catalog2({Key? key}) : super(key: key);

  @override
  _Catalog2State createState() => _Catalog2State();
}

class _Catalog2State extends State<Catalog2> {
  var _image;

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:SingleChildScrollView(
          child: Column(
              children: [
              topIcon(context,"backarrow.png","setting.png",3,BottomNavigatorBar()),
                topTitle(context, "Catalog"),
                Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
          Row(
          children: const [
          Text("Beared Style Catalog",style: TextStyle(
              color: Colors.black,fontSize: 23,fontWeight: FontWeight.bold
          ),
          ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          children: [ Text("Name",style: TextStyle(fontSize: 16,color: Colors.black),)],
        ),
        TextFormField(
            decoration: InputDecoration(
              alignLabelWithHint: false,
              labelText: "e.g Circle Beared",
              filled: true,
              fillColor: Color(0xffF6F6F6),
              contentPadding: const EdgeInsets.only(
                  left: 14.0, bottom: 6.0, top: 8.0),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10.0),
              ),
            )),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: const [ Text("Description",
            style: TextStyle(fontSize: 16,color: Colors.black),)],
        ),
        TextFormField(
            decoration: InputDecoration(
              alignLabelWithHint: false,
              labelText: "e.g HC 8987",
              filled: true,
              fillColor: Color(0xffF6F6F6),
              contentPadding: const EdgeInsets.only(
                  left: 14.0, bottom: 6.0, top: 8.0),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10.0),
              ),
            )),
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
            ],

        ),
      ),
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20, top: 8),

                child:  Row(
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
                            MaterialPageRoute(builder: (context) => SkCatalog3()),
                          );
                        }
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
