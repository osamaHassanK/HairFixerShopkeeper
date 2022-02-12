import 'package:carousel_slider/carousel_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:hairfixxer_shopkeeper/Utilities/my_navigator.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/loading_widget.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/catalog_screen/deals_screen/DealScreenViewModel.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/catalog_screen/deals_screen/DealsSlider.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/catalog_screen/deals_screen/EmptyDealWidget.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/create_deals_screen/CreateDealsScreen.dart';

import '../EmptyCatalogWidget.dart';

class DealScreen extends StatefulWidget {
  const DealScreen({Key? key}) : super(key: key);

  @override
  _DealScreenState createState() => _DealScreenState();
}

class _DealScreenState extends State<DealScreen> {
  CarouselController carouselController = CarouselController();
  DealScreenViewModel dealScreenViewModel = Get.put(DealScreenViewModel());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: FutureBuilder(
        future: dealScreenViewModel.getDeals(),
        builder:
            (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> data) {
          if (data.connectionState == ConnectionState.waiting) {
            return LoadingWidget();
          }
          if (data.data!.docs.isEmpty) {
            return EmptyDealWidget(onFistItemUloadSuccesfully: () {
                setState(() {});



            });
          }

          return SingleChildScrollView(
            child: DealsAndDiscountSlider(
              sliderController: carouselController,
              onTapOnNextSliderButton: () {
                carouselController.nextPage();
              },
              onTapOnPreviousSliderButton: () {
                carouselController.previousPage();
              },
              onTapOnAddButton: () async {
                goToNextScreen(context, CreateDealsScreen(),
                    reloadCallback: () => setState(() {}));
                // var data = await Get.to(()=>CreateDealsScreen());
                // if (data == 'success'){
                //
                // }
              },
              onTapOnDltButton: (docId) {
                dealScreenViewModel.showDltDialog(
                    context: context,
                    titleText: 'Delete Deal',
                    DescText: 'Are you sure ?',
                    ontapOnYes: () {

                      Get.snackbar('Deleting!', 'please wait',
                          snackPosition:
                          SnackPosition.BOTTOM);

                      dealScreenViewModel.dltDeal(docId,
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



                    },
                    onTapOnCanel: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    });
              },
              onTapOnUpdateButton: () {
                setState(() {});
              },
              deals: data.data!.docs,
            ),
          );
        },
      ),
    );
  }
}
