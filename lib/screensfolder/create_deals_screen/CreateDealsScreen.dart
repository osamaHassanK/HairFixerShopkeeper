import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:hairfixxer_shopkeeper/Utilities/Responsive.dart';
import 'package:hairfixxer_shopkeeper/auth/app_colors.dart';
import 'package:hairfixxer_shopkeeper/model/Deal.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/MyCustomBtn.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/ScreenBg.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/TopBar.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/loading_widget.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/my_button.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/my_text_field.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/my_text_widget.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/create_deals_screen/CreateDealsScreenViewModel.dart';


class CreateDealsScreen extends StatefulWidget {
  Deal? deal;
  bool isComingFromEdit;
  CreateDealsScreen({Key? key,this.deal,this.isComingFromEdit=false}) : super(key: key);

  @override
  _CreateDealsScreenState createState() => _CreateDealsScreenState();
}

class _CreateDealsScreenState extends State<CreateDealsScreen> {

  CreateDealsScreenViewModel createDealsScreenViewModel =
  Get.put(CreateDealsScreenViewModel());

  var dealNameController = TextEditingController();
  var originalPriceController = TextEditingController();
  var discountedPriceController = TextEditingController();

  final services = ['Hair Cut', 'Shave', 'Massage', 'Hair Color'];
  List<String>? selectedServices = [];




  @override
  void initState() {


if(widget.isComingFromEdit){

  dealNameController.text=widget.deal!.dealName;
  originalPriceController.text=widget.deal!.originalPrice.toString();
  discountedPriceController.text=widget.deal!.discountedPrice.toString();

  selectedServices=List<String>.from(widget.deal!.services) ;

}


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Obx(() => createDealsScreenViewModel.isClicked.isTrue
                ? LoadingWidget()
                : SingleChildScrollView(
              child: Stack(
                children: [
                  ScreenBg(),
                  Column(
                    children: [
                      TopBarWidget(
                        context: context,
                        backButtonPath: 'back_btn_white_stroke.png',
                        text: widget.isComingFromEdit? 'Edit Your Deal':'Create Deal',
                        topBarColor: AppColor.APP_YELLOW_COLOR,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            myResponsiveText(
                                marginLeft: 5,
                                marginTop: 15,
                                text: 'Select Services',
                                align: TextAlign.start,
                                textColor: Colors.black,
                                weight: FontWeight.normal,
                                initialFontSize: 16),
                            MyCustomBtn(
                              context: context,
                              width: Responsive.responsiveWidth(context),
                              height: 40.h,
                              color: AppColor.TEXT_FIELD_YELLOW_COLOR,
                              btnTextColor: Colors.black26,
                              btnText: 'Click Here To Select',
                              align: Alignment.centerLeft,
                              textMarginLeft: 10,
                              onTap: () {
                                createDealsScreenViewModel
                                    .showMultiSelect(context, services,selectedServices,
                                        (selectedServices) {
                                      this.selectedServices =
                                          selectedServices;
                                    });
                              },
                            ),
                            myResponsiveText(
                                marginTop: 10,
                                marginLeft: 5,
                                text: 'Deal Name',
                                align: TextAlign.start,
                                textColor: Colors.black,
                                weight: FontWeight.normal,
                                initialFontSize: 16),
                            my_text_field(
                                controller: dealNameController,
                                hintText: "e.g Amazing Deal",
                                innerContentPaddingLeft: 10,
                                fieldColor:
                                AppColor.TEXT_FIELD_YELLOW_COLOR),
                            myResponsiveText(
                                marginLeft: 5,
                                marginTop: 10,
                                text: "Original Price",
                                align: TextAlign.start,
                                textColor: Colors.black,
                                weight: FontWeight.normal,
                                initialFontSize: 16),
                            my_text_field(
                              inputType: TextInputType.number,
                                controller: originalPriceController,
                                hintText: "e.g 200",
                                innerContentPaddingLeft: 10,
                                fieldColor:
                                AppColor.TEXT_FIELD_YELLOW_COLOR,),
                            myResponsiveText(

                                marginLeft: 5,
                                marginTop: 10,
                                text: "Discounted Price",
                                align: TextAlign.start,
                                textColor: Colors.black,
                                weight: FontWeight.normal,
                                initialFontSize: 16),
                            my_text_field(
                              inputType: TextInputType.number,
                                controller: discountedPriceController,
                                hintText: "e.g 150",
                                innerContentPaddingLeft: 10,
                                fieldColor:
                                AppColor.TEXT_FIELD_YELLOW_COLOR),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                myButton(
                                    textColor: Colors.white,
                                    buttonText: widget.isComingFromEdit?'UPDATE': 'DONE',
                                    height: 15,
                                    widht: 50,
                                    cornerRadius: 10,
                                    textFontSize: 18,
                                    onTap: () {
                                      if (dealNameController
                                          .text.isNotEmpty &&
                                          originalPriceController.text !=
                                              null &&
                                          discountedPriceController
                                              .text !=
                                              null &&
                                          selectedServices!.isNotEmpty) {


                                        createDealsScreenViewModel
                                            .isClicked.value = true;

                                        !widget.isComingFromEdit?
                                        createDealsScreenViewModel
                                            .uploadDealInfo({
                                          'services': selectedServices,
                                          'dealName': dealNameController
                                              .text
                                              .toString(),
                                          'originalPrice':
                                          originalPriceController.text
                                              .toString(),
                                          'discountedPrice':
                                          discountedPriceController
                                              .text
                                              .toString(),
                                          'createdAt':FieldValue.serverTimestamp()
                                        }).whenComplete(() {
                                          Get.snackbar(
                                              'Deal has been created..',
                                              '',
                                              snackPosition:
                                              SnackPosition.BOTTOM);

                                          createDealsScreenViewModel
                                              .isClicked.value = false;
                                          Navigator.pop(context);
                                          // Get.back(result: 'success');
                                        }).onError((error, stackTrace) {
                                          createDealsScreenViewModel
                                              .isClicked.value = false;
                                          Get.snackbar(
                                              'Something Went Wrong! Try Again',
                                              '',
                                              snackPosition:
                                              SnackPosition.BOTTOM);
                                          createDealsScreenViewModel
                                              .isClicked.value = false;

                                        }): createDealsScreenViewModel.updateData({

                                          'services': selectedServices,
                                          'dealName': dealNameController
                                              .text
                                              .toString(),
                                          'originalPrice':
                                          originalPriceController.text
                                              .toString(),
                                          'discountedPrice':
                                          discountedPriceController
                                              .text
                                              .toString(),
                                          'createdAt':FieldValue.serverTimestamp()

                                        }, widget.deal!.dealId).onError((error, stackTrace) {
                                          Get.snackbar(
                                              'Something Went Wrong! Try Again',
                                              '',
                                              snackPosition:
                                              SnackPosition.BOTTOM);
                                          createDealsScreenViewModel
                                              .isClicked.value = false;


                                        }).whenComplete(() {

                                        Get.snackbar(
                                        'Deal has been Edited..',
                                        '',
                                        snackPosition:
                                        SnackPosition.BOTTOM);
                                        createDealsScreenViewModel
                                            .isClicked.value = false;
                                            Navigator.pop(context);
                                        });
                                      } else {
                                        Get.snackbar(
                                            'Please Fill All Fields', '',
                                            snackPosition:
                                            SnackPosition.BOTTOM);
                                      }

                                      // if (catalogItemNameController
                                      //     .text.isNotEmpty &&
                                      //     createCatalogViewModel.price != null &&
                                      //     createCatalogViewModel.category != null &&
                                      //     createCatalogViewModel.image.value != null) {
                                      //
                                      //   createCatalogViewModel.isClicked.value = true;
                                      //   Get.snackbar('Please wait!', '',
                                      //       snackPosition: SnackPosition.BOTTOM);
                                      //   //
                                      //   //
                                      //   // setState(() {
                                      //   //
                                      //   // });
                                      //   !widget.wantToUpdateItem
                                      //       ? createCatalogViewModel
                                      //       .uploadImageToFirebaseStorageAndUploadCatalogData(
                                      //       context,
                                      //       catalogItemNameController,
                                      //       createCatalogViewModel.price!.value,
                                      //       createCatalogViewModel.category!.value,
                                      //       createCatalogViewModel.image.value,
                                      //       imageAddressInFirebaseStorage,
                                      //       onUploadSuccessfully: () {
                                      //
                                      //         createCatalogViewModel.isClicked.value = false;
                                      //         Get.back(result: 'success');
                                      //
                                      //       }, onError: () {
                                      //     createCatalogViewModel.isClicked.value = false;
                                      //
                                      //   })
                                      //       : createCatalogViewModel
                                      //       .editCatalogItem(
                                      //       context,
                                      //       widget.docId,
                                      //       lastImageFile,
                                      //       createCatalogViewModel.image.value,
                                      //       CatalogItem.withOneLessArg(
                                      //           catalogItemNameController
                                      //               .text,
                                      //           createCatalogViewModel.price!.value,
                                      //           createCatalogViewModel.category!.value,
                                      //           widget.catalogItemData!
                                      //               .catalogItemImgUrl),
                                      //           () {
                                      //         isClicked = false;
                                      //         Get.back(result: 'success');
                                      //         //Navigator.pop(context);
                                      //         //createCatalogViewModel.showShopCompletionDialog(context);
                                      //       });
                                      // } else {
                                      //   showSnackBar(
                                      //       context: context,
                                      //       text:
                                      //       'Please fill all Four fields completely!');
                                      // }
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
                ],
              ),
            ))));
  }
}





