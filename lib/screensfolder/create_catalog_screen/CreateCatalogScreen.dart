import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:hairfixxer_shopkeeper/Utilities/base.dart';
import 'package:hairfixxer_shopkeeper/auth/app_colors.dart';
import 'package:hairfixxer_shopkeeper/base.dart';
import 'package:hairfixxer_shopkeeper/model/CatalogItem.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/DropDownWidget.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/MyContainer.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/container_widget.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/loading_widget.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/my_button.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/my_text_field.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/my_text_widget.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/top_icon&title.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/bottom_navigation_bar/bottom_navigator_bar.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/create_catalog_screen/CreateCatalogViewModel.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';

class CreateCatalogScreen extends StatefulWidget {
  bool wantToAddNewItem = false;
  bool wantToUpdateItem = false;
  String? docId;

  CatalogItem? catalogItemData;

  CreateCatalogScreen(
      {Key? key,
      this.wantToAddNewItem = false,
      this.wantToUpdateItem = false,
      this.docId,
      this.catalogItemData})
      : super(key: key);

  @override
  _CreateCatalogScreenState createState() => _CreateCatalogScreenState();
}

class _CreateCatalogScreenState extends State<CreateCatalogScreen> {
  var imageAddressInFirebaseStorage;
  late bool isClicked;
  TextField1 textF = TextField1();
  var createCatalogViewModel = Get.put(CreateCatalogViewModel());


  var priceList = [
    '50',
    '80',
    '100',
    '130',
    '150',
    '180',
    '200',
    '230',
    '250',
    '280',
    '300',
    '330',
    '350',
    '380',
    '400',
    '430',
    '450',
    '480',
    '500'
  ];
  var categoryList = [
    'Hair Cut',
    'Shave',
    'Manicure',
    'Padicure',
    'Hair Color',
    'Massage',
    'Facial',
  ];
  var catalogItemNameController = TextEditingController();

  var lastImageFile;

  @override
  void initState() {
    super.initState();

    isClicked = false;
    if (widget.wantToUpdateItem) {
      catalogItemNameController.text = widget.catalogItemData!.catalogItemName!;
      createCatalogViewModel.category = widget.catalogItemData!.catalogItemCategory! as RxString?;
      createCatalogViewModel.price = widget.catalogItemData!.catalogItemPrice! as RxString?;

      if (mounted) {
        createCatalogViewModel
            .urlToFile(widget.catalogItemData!.catalogItemImgUrl!)
            .then((value) {
          setState(() {
            createCatalogViewModel.image.value = value;
            lastImageFile = value;
          });
        });
      }
    }
  }
  //var createCatalogViewModel = Get.put(CreateCatalogViewModel());

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Obx(()=> createCatalogViewModel.isClicked.isTrue?LoadingWidget()  :SingleChildScrollView(
          child: Column(
            children: [
              topIcon(
                  context,
                  "backarrow.png",
                  widget.wantToAddNewItem
                      ? 'Add New Item'
                      : widget.wantToUpdateItem
                      ? 'Update Your Catalog Item'
                      : 'Create Your Catalog',
                  4,
                  BottomNavigatorBar()),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    myResponsiveText(
                        marginLeft: 5,
                        text:  'Enter name of catalog item',
                        align: TextAlign.start,
                        textColor: Colors.black,
                        weight: FontWeight.normal,
                        initialFontSize: 16),

                    my_text_field(
                        controller: catalogItemNameController,
                        hintText: "e.g Circle Beared",
                        innerContentPaddingLeft: 10,
                        fieldColor: AppColor.TEXT_FIELD_YELLOW_COLOR),
                    myResponsiveText(
                        marginLeft: 5,
                        marginTop: 10,
                        text: "Price",
                        align: TextAlign.start,
                        textColor: Colors.black,
                        weight: FontWeight.normal,
                        initialFontSize: 16),
                    DropDownWidget(

                      list: priceList,
                      hint: createCatalogViewModel.price,
                      callback: (price) {

                        this.createCatalogViewModel.price!.value = price;

                      },
                    ),
                    myResponsiveText(
                        marginLeft: 5,
                        marginTop: 10,
                        text: "Select Category",
                        align: TextAlign.start,
                        textColor: Colors.black,
                        weight: FontWeight.normal,
                        initialFontSize: 16),
                    DropDownWidget(
                      list: categoryList,
                      hint: createCatalogViewModel.category!,
                      callback: (category) {

                        createCatalogViewModel.category!.value = category;

                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    myResponsiveText(
                        text: "4. Upload your Image",
                        textColor: Colors.black,
                        initialFontSize: 15,
                        marginLeft: 8),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: InkWell(
                        onTap: () => createCatalogViewModel.pickImage(
                            context, ImgSource.Gallery, (croppedImage,
                            ImageAddressInFirebaseStorage) {
                            createCatalogViewModel.image.value = croppedImage;
                            this.imageAddressInFirebaseStorage =
                                ImageAddressInFirebaseStorage;

                        }),
                        child: containerSk(
                            context,
                            330,
                            double.infinity,
                            Color(0xffF6F6F6),
                            null,
                            createCatalogViewModel.image != null
                                ? Image.file(
                              File(createCatalogViewModel.image.value.path),
                              fit: BoxFit.cover,
                            )
                                : Center(
                                child: myUnResponsiveContainer(
                                  context: context,
                                  marginLeft: 20,
                                  marginRight: 20,
                                  child: Image.asset(
                                      "assets/upload_image_icon.png"),
                                  width: double.infinity,
                                  height: 80,
                                ))),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        myButton(
                            textColor: Colors.white,
                            buttonText: 'Done',
                            height: 15,
                            widht: 50,
                            cornerRadius: 10,
                            textFontSize: 18,
                            onTap: () {

                              if (catalogItemNameController
                                  .text.isNotEmpty &&
                                  createCatalogViewModel.price != null &&
                                  createCatalogViewModel.category != null &&
                                  createCatalogViewModel.image.value != null) {

                                createCatalogViewModel.isClicked.value = true;
                                Get.snackbar('Please wait!', '',
                                    snackPosition: SnackPosition.BOTTOM);
                                //
                                //
                                // setState(() {
                                //
                                // });
                                !widget.wantToUpdateItem
                                    ? createCatalogViewModel
                                    .uploadImageToFirebaseStorageAndUploadCatalogData(
                                    context,
                                    catalogItemNameController,
                                    createCatalogViewModel.price!.value,
                                    createCatalogViewModel.category!.value,
                                    createCatalogViewModel.image.value,
                                    imageAddressInFirebaseStorage,
                                    onUploadSuccessfully: () {

                                        createCatalogViewModel.isClicked.value = false;
                                        Get.back(result: 'success');

                                    }, onError: () {
                                    createCatalogViewModel.isClicked.value = false;

                                })
                                    : createCatalogViewModel
                                    .editCatalogItem(
                                    context,
                                    widget.docId,
                                    lastImageFile,
                                    createCatalogViewModel.image.value,
                                    CatalogItem.withOneLessArg(
                                        catalogItemNameController
                                            .text,
                                        createCatalogViewModel.price!.value,
                                        createCatalogViewModel.category!.value,
                                        widget.catalogItemData!
                                            .catalogItemImgUrl),
                                        () {
                                      isClicked = false;
                                      Get.back(result: 'success');
                                      //Navigator.pop(context);
                                      //createCatalogViewModel.showShopCompletionDialog(context);
                                    });
                              } else {
                                showSnackBar(
                                    context: context,
                                    text:
                                    'Please fill all Four fields completely!');
                              }
                            }),
                        // ElevatedButton(
                        //   child: Text(
                        //     ' Done ',
                        //     style: TextStyle(fontSize: 18),
                        //   ),
                        //   style: ElevatedButton.styleFrom(
                        //     primary: Color(0xffD7A700),
                        //     onPrimary: Colors.white,
                        //     shape: const BeveledRectangleBorder(
                        //         borderRadius:
                        //             BorderRadius.all(Radius.circular(5))),
                        //   ),
                        //   onPressed: () {},
                        // ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )


        )));

    //     isClicked
    //         ? LoadingWidget()
    //         :
    //   ),
    // );
  }

  // Future getImage(ImgSource source) async {
  //   var image = await ImagePickerGC.pickImage(
  //       enableCloseButton: true,
  //       closeIcon: Icon(
  //         Icons.close,
  //         color: Colors.red,
  //         size: 12,
  //       ),
  //       context: context,
  //       source: source,
  //       barrierDismissible: true,
  //       cameraIcon: Icon(
  //         Icons.camera_alt,
  //         color: Colors.red,
  //       ),
  //       //cameraIcon and galleryIcon can change. If no icon provided default icon will be present
  //       cameraText: Text(
  //         "From Camera",
  //         style: TextStyle(color: Colors.red),
  //       ),
  //       galleryText: Text(
  //         "From Gallery",
  //         style: TextStyle(color: Colors.blue),
  //       ));
  //   setState(() {
  //     _image = image;
  //   });
  // }
}
