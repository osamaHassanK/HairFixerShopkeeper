import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/MyContainer.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/MyCustomBtn.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/MySlider.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/loading_widget.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/top_icon&title.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/catalog_screen/CatalogScreenViewModel.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/catalog_screen/EmptyCatalogWidget.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/create_catalog_screen/CreateCatalogScreen.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/create_deals_screen/CreateDealsScreen.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/select_services/SelectServicesScreen.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  //fields
  var viewModel = CatalogScreenViewModel();
  CarouselController carouselController = CarouselController();
  var data = 'unSuccessful';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: viewModel.getCatalogAvailabilityStatus(),
          builder: (BuildContext context, AsyncSnapshot<bool?> data) {
            if (data.connectionState == ConnectionState.waiting) {
              return LoadingWidget();
            }
            if (data.data == true) {
              return EmptyCatalogWidget();
            }

            return Column(
              children: [
                FutureBuilder(
                  future: viewModel.getCatalogItems(),
                  builder: (context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          data) {
                    if (data.connectionState == ConnectionState.waiting) {
                      return LoadingWidget();
                    }
                    if (data.data!.docs.isEmpty) {
                      return EmptyCatalogWidget(
                          onFistItemUloadSuccesfully: (data) {
                        if (data == 'success') setState(() {});
                      });
                    }

                    return myUnResponsiveContainer(
                      width: double.infinity,
                      height: 580,
                      child: MySlider(
                        sliderController: carouselController,
                        dataList: data.data!.docs,
                        onTapOnNextSliderButton: () {
                          carouselController.nextPage();
                        },
                        onTapOnPreviousSliderButton: () {
                          carouselController.previousPage();
                        },
                        onAddNewItem: () async {
                          var data = await Get.to(() =>
                              CreateCatalogScreen(
                                  wantToAddNewItem: true));
                          if (data == 'success') setState(() {});
                          // goToNextScreen(
                          //     context,
                          //     CreateCatalogScreen(
                          //         wantToAddNewItem: true));
                        },
                        onTapOnEditIcon: (data) {
                          if (data == 'success') {
                            setState(() {});
                          }
                        },
                        onTapOnDltIcon: (docId) {
                          viewModel.showDltDialog(
                              context: context,
                              titleText: 'Delete Catalog Item',
                              DescText: 'Are you sure?',
                              onTapOnCanel: () => Navigator.of(context,
                                      rootNavigator: true)
                                  .pop(),
                              ontapOnYes: () {
                                Get.snackbar('Deleting!', 'please wait',
                                    snackPosition:
                                        SnackPosition.BOTTOM);

                                viewModel.dltCatalog(docId,
                                    onDltSuccessfully: () {
                                      setState(() {});
                                      //Get.back(closeOverlays: true);
                                      Navigator.of(context,
                                              rootNavigator: true)
                                          .pop();
                                    },
                                    onError: (error) => {
                                          print(error.toString()),
                                          Get.snackbar(
                                              'we are having some problem',
                                              error.toString())
                                        });
                              });

//viewModel.showDialog(context: context, text: 'dialog');
                        },
                      ),
                      context: context,
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    ));
  }
}
