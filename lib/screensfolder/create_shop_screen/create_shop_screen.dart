import 'dart:async';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hairfixxer_shopkeeper/Utilities/Checker.dart';
import 'package:hairfixxer_shopkeeper/Utilities/base.dart';
import 'package:hairfixxer_shopkeeper/Utilities/firestore_services.dart';
import 'package:hairfixxer_shopkeeper/Utilities/my_navigator.dart';
import 'package:hairfixxer_shopkeeper/model/ShopInfo.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/container_widget.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/loading_widget.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/my_button.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/my_drop_down_widget.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/my_text_widget.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/textfield_widget.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/bottom_navigation_bar/bottom_navigator_bar.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/sk_notification.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';

import '../../Utilities/FirestoreDbRerences.dart';

class ShopRegistrationForm extends StatefulWidget {
  const ShopRegistrationForm({Key? key}) : super(key: key);

  @override
  State<ShopRegistrationForm> createState() => _ShopRegistrationFormState();
}

String opening_time = '8 Am';
String closing_time = '10 Pm';
late bool isClicked;

class _ShopRegistrationFormState extends State<ShopRegistrationForm> {
  var _image;
  final shopNameController = TextEditingController();
  final shopAddressController = TextEditingController();
  final shopContactController = TextEditingController();

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
    super.initState();
    isClicked = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: isClicked
            ? LoadingWidget()
            : SingleChildScrollView(
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
                                    "e.g Men’s Beauty Salon", true,
                                    controller: shopNameController),
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
                                child: textFieldN("e.g: 03101234567", true,
                                    controller: shopContactController),
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
                                            "Enter Your shop address", true,
                                            controller: shopAddressController)),
                                    Expanded(
                                        flex: 1,
                                        child: InkWell(
                                            onTap: () async {
                                              await getCurrentLocation()
                                                  .whenComplete(() {
                                                shopAddressController.text =
                                                    _currentAddress;
                                                setState(() {});
                                              });
                                            },
                                            child: Icon(Icons
                                                .add_location_alt_outlined)))
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
                                  onTap: () =>
                                      selectImageFormGallery(ImgSource.Gallery),
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
                                padding: const EdgeInsets.only(
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
                                      buttonText: 'Done',
                                      height: 13,
                                       textFontSize: 10,
                                      widht: 30,
                                      onTap: () => isClicked
                                          ? null
                                          : uploadImageToFirebaseStorage(),
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

// void _clearImage() {
//   imageFile = null;
//   setState(() {
//     state = AppState.free;
//   });
// }

  var locationMessage = "";
  String _currentAddress = "";
  final geo = Geoflutterfire();
  late GeoFirePoint myLocation;

  Future getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    var longitude = position.longitude, latitude = position.latitude;
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    Placemark place = placemarks[0];

    setState(() {
      locationMessage = "$latitude , $longitude";
      _currentAddress =
          "${place.street}, ${place.locality},${place.administrativeArea}, ${place.country}";
      myLocation = geo.point(
        latitude: latitude,
        longitude: longitude,
      );
      print(locationMessage);
      print(_currentAddress);
    });
  }

  Future<void> uploadShopData({required Shop shop, required String uId}) async {
    final ref = shopUserRef.withConverter<Shop>(
      fromFirestore: (snapshot, _) => Shop.fromJson(snapshot.data()!),
      toFirestore: (shop, _) => shop.toJson(),
    );

    await ref.update({

      'shopInfo':{
        'shopName': shop.shopName,
        'shopImgUrl': shop.shopImgUrl,
        'shopClosingTiming': shop.shopClosingTiming,
        'shopOpeningTiming': shop.shopOpeningTiming,
        'shopAddress': shop.shopAddress,
        'shopContactNo': shop.shopContactNo,
        'shopLocation': shop.shopLocation,
        'isCatalogEmpty': shop.isCatalogEmpty
      }
    }).then((value) {
      //    saveStringInLocalMemory(Constant.ISSHOPEXIST, "true");
      //goToNextScreenWithoutStack(context, BottomNavigatorBar());
      // Fluttertoast.showToast(msg: "Shop Created Successfully");

      print("everthing is ok");
      setState(() {
        //isLoading=false;
        isClicked = false;
      });
    }).catchError((error) {
      setState(() {
        //isLoading=false;
        isClicked = false;
      });
      //Fluttertoast.showToast(msg: error );

      //print("Failed to add user: $error");
    });
  }

  Future<void> uploadImageToFirebaseStorage() async {
    if (shopContactController.text.isNotEmpty &&
        shopAddressController.text.isNotEmpty &&
        shopNameController.text.isNotEmpty &&
        _image != null) {
      try {
        setState(() {
          isClicked = true;
        });

        firebaseStorageShopCatalogImagesRef
            .child(userId! + "shopImage")
            .putFile(_image)
            .then((res) async {
          var imageUrl = await res.ref.getDownloadURL();

          uploadShopData(
              shop: Shop(
                  userId,
                  shopNameController.text,
                  shopAddressController.text,
                  shopContactController.text,
                  imageUrl,
                  opening_time,
                  closing_time,
                  myLocation.data,
                  true),
              uId: userId!);
          print(imageUrl);
        }).then((value) {
          shopUserRef.update({"shopLocation": myLocation.data}).then((value) {
            updateData({'isShopCreated': true}).whenComplete(() {
              setState(() {
                isClicked = false;
              });

              goToNextScreenWithoutStack(context, BottomNavigatorBar());
            });
          }).whenComplete(() {});
        });
      } on FirebaseException catch (e) {
        if (e is SocketException) {
          showSnackBar(
              context: context, text: 'Please Check You Network Connection');
          print("Socket exception: ${e.toString()}");
        } else if (e is TimeoutException) {
          showSnackBar(context: context, text: 'Timeout Please Try Again');
          print("Timeout exception: ${e.toString()}");
        } else {
          showSnackBar(
              context: context,
              text: 'Something Went Wrong Please Try Again Later');
          print("Unhandled exception: ${e.toString()}");
        }
      }
    } else {
      showSnackBar(
          context: context, text: 'Please fill all three fields completely!');
    }
  }

  showShopCompletionDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Congratulation",
              style: TextStyle(color: Color(0xffD7A700)),
              textAlign: TextAlign.center,
            ),
            content: Text("Your Shop has been Registered successfully"),
            actions: <Widget>[
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => Notifications(),
                      ));
                    },
                    child: Text("close")),
              ),
            ],
          );
        });
  }
}
