import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hairfixxer_shopkeeper/Utilities/Checker.dart';
import 'package:hairfixxer_shopkeeper/Utilities/firestore_services.dart';
import 'package:hairfixxer_shopkeeper/auth/app_colors.dart';
import 'package:hairfixxer_shopkeeper/main.dart';
import 'package:hairfixxer_shopkeeper/model/ShopInfo.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/MyContainer.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/loading_widget.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/my_button.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/my_drop_down_widget.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/my_text_field.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/my_text_widget.dart';
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';
import 'package:path_provider/path_provider.dart';

class EditShopScreen extends StatefulWidget {
  final Shop shop;

  const EditShopScreen({Key? key, required this.shop}) : super(key: key);

  @override
  _EditShopScreenState createState() => _EditShopScreenState();
}

class _EditShopScreenState extends State<EditShopScreen> {
  var _image;
  var lastImageFile;
  final shopNameController = TextEditingController();
  final shopAddressController = TextEditingController();
  final shopContactController = TextEditingController();
  String opening_time = '8 Am';
  String closing_time = '10 Pm';
  late bool isClicked=false;

  final timingList = [
    '8 Am',
    '9 Am',
    '10 Am',
    '11 Am',
    '12 Pm',
    '1 Pm',
    '2 Pm',
    '3 Pm',
    '4 Pm',
    '5 Pm',
    '6 Pm',
    '7 Pm',
    '8 Pm',
    '9 Pm',
    '10 Pm',
    '11 Pm',
    '12 Am',
  ];










  @override
  void initState() {
    shopNameController.text= widget.shop.shopName!;
    shopAddressController.text = widget.shop.shopAddress!;
    shopContactController.text = widget.shop.shopContactNo!;
    isClicked = false;
    opening_time = widget.shop.shopOpeningTiming!;
    closing_time = widget.shop.shopClosingTiming!;
if(mounted){
  urlToFile(widget.shop.shopImgUrl!).then((value) {
    setState(() {
      _image = value;
      lastImageFile = value;
    });
  });
}


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child:isClicked?LoadingWidget() : Column(
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
                      child: InkWell(
                        onTap: ()=>Navigator.pop(context),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
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
                    //   child: Image.asset("assets/settingicon.png",scale: 4,),
                    // ),

                    Column(
                      children: [
                        const SizedBox(
                          height: 35,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            getShopKeeperImageUrl(),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            myResponsiveText(
                              text: "Hello ",
                              textColor: AppColor.APP_YELLOW_COLOR,
                              initialFontSize: 22,
                              weight: FontWeight.w400,
                            ),
                            myResponsiveText(
                              text: shopKeeperName,
                              align: TextAlign.start,
                              textColor: AppColor.APP_YELLOW_COLOR,
                              initialFontSize: 22,
                              weight: FontWeight.w700,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        myResponsiveText(
                          text: "Update your Shop",
                          initialFontSize: 12,
                          textColor: Colors.black,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            myResponsiveText(
                              marginLeft: 8,
                              text: "1. Enter your Shop Name",
                              initialFontSize: 17,
                              textColor: Colors.black,
                            ),
                            my_text_field(
                              controller: shopNameController
                                ,
                              fieldColor: Color(0xffF6F6F6),
                              hintText: widget.shop.shopName,
                              marginLeft: 30,
                              marginTop: 10,
                              marginRight: 30,
                              marginBottom: 10,
                              innerContentPaddingLeft: 14,
                              innerContentPaddingBottom: 6,
                              innerContentPaddingTop: 8,
                            ),
                            myResponsiveText(
                              marginLeft: 8,
                              text: "1. Enter your shop address",
                              initialFontSize: 17,
                              textColor: Colors.black,
                            ),
                            my_text_field(
                              controller: shopAddressController,
                              fieldColor: Color(0xffF6F6F6),
                              hintText: widget.shop.shopAddress,
                              marginLeft: 30,
                              marginTop: 10,
                              marginRight: 30,
                              marginBottom: 10,
                              innerContentPaddingLeft: 14,
                              innerContentPaddingBottom: 6,
                              innerContentPaddingTop: 8,
                            ),
                            myResponsiveText(
                              marginLeft: 8,
                              text: "3. Enter your shop contact no",
                              initialFontSize: 17,
                              textColor: Colors.black,
                            ),
                            my_text_field(
                              controller: shopContactController..text = widget.shop.shopContactNo!,
                              fieldColor: Color(0xffF6F6F6),
                              hintText: widget.shop.shopContactNo,
                              marginLeft: 30,
                              marginTop: 10,
                              marginRight: 30,
                              marginBottom: 10,
                              innerContentPaddingLeft: 14,
                              innerContentPaddingBottom: 6,
                              innerContentPaddingTop: 8,
                            ),
                            myResponsiveText(
                              marginLeft: 8,
                              text: "4. select your shop image",
                              initialFontSize: 17,
                              textColor: Colors.black,
                            ),
                            InkWell(
                              onTap: () =>
                                  selectImageFormGallery(ImgSource.Gallery),
                              child: myUnResponsiveContainer(
                                  marginLeft: 25,
                                  marginTop: 10,
                                  marginRight: 25,
                                  context: context,
                                  height: 200,
                                  width: double.infinity,
                                  color: Color(0xffF6F6F6),
                                  child: _image == null
                                      ? Center(
                                          child: Container(
                                          child: Image.asset(
                                              "assets/upload_image_icon.png"),
                                          width: 130,
                                          height: 60,
                                        ))
                                      : Image.file(
                                          File(_image.path),
                                        )),
                            ),
                            myResponsiveText(
                                marginTop: 8,
                                marginLeft: 8,
                                text: "5. Enter Opening and Closing Timing",
                                textColor: Color(0xff474747),
                                initialFontSize: 18),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 15.0, left: 20, right: 20, bottom: 10),
                              child: Row(
                                children: [
                                  // SizedBox(
                                  //   width: 22,
                                  // ),
                                  // Expanded(
                                  //   child: containerSk(context, 32, 120, Colors.transparent,
                                  //       null, textFieldN("10AM", true)),
                                  // ),
                                  Expanded(
                                    child: customTimeAmPmDropDown(
                                        timingList, opening_time, (newValue) {
                                      setState(() {
                                        opening_time = newValue;
                                      });
                                    }),
                                  ),
                                  Expanded(
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            right: 19, left: 19),
                                        child: myResponsiveText(
                                            text: 'To',
                                            align: TextAlign.center,
                                            textColor: Colors.black,
                                            initialFontSize: 16)),
                                  ),

                                  Expanded(
                                    child: customTimeAmPmDropDown(
                                        timingList, closing_time, (newValue) {
                                      setState(() {
                                        closing_time = newValue;
                                      });
                                    }),
                                  ),
                                  // Expanded(
                                  //   child: containerSk(context, 32, 120, Colors.transparent,
                                  //       null, textFieldN("11AM", true)),
                                  // ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                myButton(
                                    buttonText: 'Update',
                                    textColor: Colors.white,
                                    height: 13,
                                    widht: 30,
                                    textFontSize: 15,
                                    onTap: ()

                                    {
                                      setState(() {
                                        isClicked=true;
                                      });
                                      updateShopInfo(
                                          context,
                                          lastImageFile,
                                          _image,
                                          Shop.withoutCatalogStatus(
                                              "",
                                              shopNameController.text,
                                              shopAddressController.text,
                                              shopContactController.text,
                                              widget.shop.shopImgUrl,
                                              opening_time,
                                              closing_time,
                                              widget.shop.shopLocation));

                                    }





                                    ,cornerRadius: 15),
                              ],
                            ),
                          ],
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

  Future selectImageFormGallery(ImgSource source) async {
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
        aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 0.6));
    if (croppedImage != null) {
      setState(() {
        _image = croppedImage;
      });
    }
  }

  Future<File> urlToFile(String imageUrl) async {
// generate random number.
    var rng = new Random();
// get temporary directory of device.
    Directory tempDir = await getTemporaryDirectory();
// get temporary path from temporary directory.
    String tempPath = tempDir.path;
// create a new file in temporary path with random file name.
    File file = new File('$tempPath' + (rng.nextInt(100)).toString() + '.png');
// call http.get method and pass imageUrl into it to get response.
    http.Response response = await http.get(Uri.parse(imageUrl));
// write bodyBytes received in response to file.
    await file.writeAsBytes(response.bodyBytes);
// now return the file which is created with random name in
// temporary directory and image bytes from response is written to // that file.
    return file;
  }

}
