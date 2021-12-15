import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:hairfixxer_shopkeeper/Utilities/Checker.dart';
import 'package:hairfixxer_shopkeeper/Utilities/my_navigator.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/container_widget.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/my_button.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/my_text_widget.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/textfield_widget.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';

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
            child: Stack(
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
                    child: InkWell(
                      onTap: () => goBack(context),
                      child: Image.asset(
                        "assets/backarrow.png",
                        scale: 4,
                      ),
                    ),
                  ),
                ),
                // Positioned(
                //   top: 10,
                //   right: 5,
                //   child: Image.asset(
                //     "assets/settingicon.png",
                //     scale: 4,
                //   ),
                // ),
                Column(
                  children: [
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        getShopKeeperImageUrl(),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        myResponsiveText(
                            text: 'hello',
                            align: TextAlign.center,
                            textColor: Color(0xffD7A600),
                            weight: FontWeight.w400,
                            initialFontSize: 22),
                        myResponsiveText(
                            text: ',$shopKeeperName',
                            align: TextAlign.center,
                            textColor: Color(0xffD7A600),
                            weight: FontWeight.w600,
                            initialFontSize: 22),
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    myResponsiveText(
                        text: "Registered your Shop",
                        align: TextAlign.center,
                        textColor: Color(0xff474747),
                        initialFontSize: 12),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        myResponsiveText(
                            marginLeft: 8,
                            text: "1. Enter your Shop Name",
                            align: TextAlign.center,
                            textColor: Colors.black,
                            weight: FontWeight.normal,
                            initialFontSize: 15),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 30, right: 30, bottom: 10),
                          child: textFieldN(
                            "e.g Men’s Beauty Salon",
                            true,
                          ),
                        ),
                        myResponsiveText(
                            marginLeft: 8,
                            text: "2. Enter Your Contact Number",
                            align: TextAlign.center,
                            textColor: Colors.black,
                            weight: FontWeight.normal,
                            initialFontSize: 15),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 30, right: 30, bottom: 10),
                          child: textFieldN(
                            "e.g: 03101234567",
                            true,
                          ),
                        ),
                        myResponsiveText(
                            text: "3. Enter your Shop Address",
                            textColor: Colors.black,
                            initialFontSize: 15,
                            marginLeft: 8),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 30, right: 30),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 10,
                                  child: textFieldN(
                                      "Enter Your shop address", true)),
                              Expanded(
                                  flex: 1,
                                  child: InkWell(
                                      onTap: () => print("tap"),
                                      child: Icon(
                                          Icons.add_location_alt_outlined)))
                            ],
                          ),
                        ),
                        myResponsiveText(
                            text: "4. Upload your Image",
                            textColor: Colors.black,
                            initialFontSize: 15,
                            marginLeft: 8),
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: InkWell(
                            onTap: () => getImage(ImgSource.Gallery),
                            child: containerSk(
                                context,
                                200,
                                double.infinity,
                                Color(0xffF6F6F6),
                                null,
                                _image != null
                                    ? Image.file(
                                        File(_image.path),
                                      )
                                    : Center(
                                        child: Container(
                                        child: Image.asset(
                                            "assets/upload_image_icon.png"),
                                        width: 130,
                                        height: 60,
                                      ))),
                          ),
                        ),
                        myResponsiveText(
                            marginTop: 8,
                            marginLeft: 8,
                            text: "5. Enter Opening and Closing Timing",
                            textColor: Color(0xff474747),
                            initialFontSize: 18),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 22,
                              ),
                              containerSk(context, 32, 120, Colors.transparent,
                                  null, textFieldN("10AM", true)),
                              const Padding(
                                padding: EdgeInsets.only(right: 19, left: 19),
                                child: Text(
                                  "To",
                                  style: TextStyle(fontSize: 18.5),
                                ),
                              ),
                              containerSk(context, 32, 120, Colors.transparent,
                                  null, textFieldN("11AM", true)),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            myButton(
                                buttonText: 'Done',
                                height: 13,
                                widht: 30,
                                onTap: () {
                                  print('tap');
                                },
                                cornerRadius: 15),
                          ],
                        ),
                      ],
                    )
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
        maxWidth: 1080,
        maxHeight: 1080,
        imageQuality: 50,
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
        ),
        //cameraIcon and galleryIcon can change. If no icon provided default icon will be present
        cameraText: Text(
          "From Camera",
          style: TextStyle(color: Colors.red),
        ),
        galleryText: Text(
          "From Gallery",
          style: TextStyle(color: Colors.blue),
        ));
    _cropImage(image!.path);

  }

  _cropImage(filePath) async {
    File? croppedImage = await ImageCropper.cropImage(
        sourcePath: filePath,
        maxWidth: 1080,
        maxHeight: 1080,
        aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 0.5));
    if (croppedImage != null) {
      setState(() {
        _image = croppedImage;
      });
    }
  }
// void _clearImage() {
//   imageFile = null;
//   setState(() {
//     state = AppState.free;
//   });
// }
}
