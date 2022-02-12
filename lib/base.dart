import 'dart:io';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';
import 'package:path/path.dart';

Widget imageSk(String image,double? scale,BoxFit fit ){
  return Image.asset(image,scale:scale,fit: fit);
}
class TextField1{

  Widget textField1([Function? validate,String? imageSk,Color? fillcolor,
    bool? filled,String? label,double? radius,double? circular,bool? booli]){
    return Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
    boxShadow: [
    BoxShadow(
    color: Colors.black26.withOpacity(0.1),
    blurRadius: 1,
    offset: const Offset(0, 4))
    ],),
    child:TextFormField(
      obscureText:true,
      validator: validatorEmail(),
      // controller: _emailController,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(
              left: 25, top: 12, bottom: 12, right: 20),
          child: imageSk==null? null: Image.asset(
            'assets/userimage.png',
            scale: 4,
            fit: BoxFit.fill,
          ),
        ),
        fillColor:fillcolor,
        filled: filled,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(radius==null?radius=12:radius=radius)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius==null?radius=12:radius=radius)),
        labelText: label,
        labelStyle: TextStyle(
            color: Colors.black12,
            fontWeight: FontWeight.bold,
            fontSize: 18),
      ),)
    );

  }
  validatorPasword (){
    validator: (val) {
      if (val!.isEmpty) {
        return "Please enter your Password";
      } else if (!val.contains('@')) {
        return ("Please enter a valid email");
      }
      return null;
    };
  }
  validatorEmail (){
    validator: (val) {
      if (val!.isEmpty) {
        return "Please enter your email";
      } else if (!val.contains('@')) {
        return ("Please enter a valid email");
      }
      return null;
    };
  }
}
Widget button(BuildContext context, String text, double width, double height,
    double radius, double fontSize, var fontWeight) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 2.0), //(x,y)
            blurRadius: 3.0,
          ),
        ],
        borderRadius: BorderRadius.circular(radius),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff0EA1F8), Color(0xff0465A7)])),
    child: Center(
      child: Text(text,
          style: TextStyle(
              color: Colors.white, fontSize: fontSize, fontWeight: fontWeight)),
    ),
  );



}





Future<bool> isInternetAvailable() async {
  bool result = await DataConnectionChecker().hasConnection;
  if(result == true) {
    print('YAY! Free cute dog pics!');
  } else {
    print('No internet :( Reason:');
    print(DataConnectionChecker().lastTryResults);
  }
  return result;







}





Future selectImageFormGallery(context, ImgSource source,Function( File croppedImage,String imageAddress) callback ) async {
  var image = await ImagePickerGC.pickImage(
      enableCloseButton: true,
      maxWidth: 500,
      maxHeight: 500,
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
  _cropImage(image!.path,callback);
}

_cropImage(filePath,Function( File croppedImage,String imageAddress) callback) async {
  File? croppedImage = await ImageCropper.cropImage(
      sourcePath: filePath,
      maxWidth: 1080,
      maxHeight: 1080,
      aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.1));
  if (croppedImage != null) {
    callback(croppedImage,basename(croppedImage.path));
  }
}