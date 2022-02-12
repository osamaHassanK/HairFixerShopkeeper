import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:hairfixxer_shopkeeper/Utilities/Responsive.dart';
import 'package:hairfixxer_shopkeeper/auth/app_colors.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/MyCustomBtn.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/ScreenBg.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/TopBar.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/create_deals_screen/CreateDealsScreen.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/select_services/SelectServicesScreenViewModel.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/select_services/ServicesDesignContainerWidget.dart';

class SelectServicesScreen extends StatelessWidget {
  SelectServicesScreen({Key? key}) : super(key: key);
  SelectServicesScreenViewModel selectServicesScreenViewModel =
      Get.put(SelectServicesScreenViewModel());
  final services = [
    {
      'serviceName': "Hair Cut",
      'serviceImg': 'assets/hair1.png',
    },
    {
      'serviceName': "Shave",
      'serviceImg': 'assets/shave_img.png',
    },
    {
      'serviceName': "Facial",
      'serviceImg': 'assets/facial_img.png',
    },
    {
      'serviceName': "Hair Color",
      'serviceImg': 'assets/hair4.png',
    },
    {
      'serviceName': "Massage",
      'serviceImg': 'assets/hair9.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: MyCustomBtn(
          context: context,
          height: 50.h,
          width: Responsive.responsiveWidth(context),
          color: Colors.black12,
          onTap: () {
               Get.to(()=>CreateDealsScreen());
          },
          bottomLeft: 5,
          bottomRight: 5,
          topRight: 5,
          topLeft: 5,
          marginBottom: 15,
          marginLeft: 10,
          marginRight: 15,
          btnText: 'NEXT',
        ),
        body: Stack(
          children: [
            ScreenBg(),
            Column(
              children: [
                TopBarWidget(
                  context: context,
                  backButtonPath: 'back_btn_white_stroke.png',
                  text: 'Select Services',
                  topBarColor: AppColor.APP_YELLOW_COLOR,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 10,
                    right: 10,
                  ),
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: services.length,
                    itemBuilder: (context, index) {
                      return ServicesDesignContainerWidget(
                          context: context,
                          text: services[index]['serviceName']!,
                          imageName: services[index]['serviceImg']!);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    //
    //
    // Row(
    // mainAxisAlignment: MainAxisAlignment.spaceAround,
    // children: [
    // servicesContainer(context, HairCut(), "Hair", "hair1.png"),
    // servicesContainer(context, Shave(), "Shave", "hair2.png"),
    // ],
    // ),
    // Row(
    // mainAxisAlignment: MainAxisAlignment.spaceAround,
    // children: [
    // servicesContainer(context, BodyTreatment1(), "Body Treatment", "hair3.png"),
    // servicesContainer(context, BodyTreatment2(), "Body Treatment", "hair4.png"),
    // ],
    // ),
    // Row(
    // Padding(
    // padding: const EdgeInsets.only(left: 10, right: 10,),
    //
    // child: GridView.builder(
    // physics: NeverScrollableScrollPhysics(),
    // shrinkWrap: true,
    // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    // crossAxisCount: 2,
    // crossAxisSpacing: 10.0,
    // mainAxisSpacing: 0.0,
    // ),
    // itemCount: allCatalogItems.length,
    // itemBuilder: (context, index) {
    // return allCatalogItemScreenViewModel.servicesContainer(
    // context,
    // HairCut(),
    // allCatalogItems[index]['catalogItemName'],
    // allCatalogItems[index]['catalogItemImgUrl']);
    // },
    // ),
    // ),
    //
    //
    // Row(
    // mainAxisAlignment: MainAxisAlignment.spaceAround,
    // children: [
    // servicesContainer(context, HairCut(), "Hair", "hair1.png"),
    // servicesContainer(context, Shave(), "Shave", "hair2.png"),
    // ],
    // ),
    // Row(
    // mainAxisAlignment: MainAxisAlignment.spaceAround,
    // children: [
    // servicesContainer(context, BodyTreatment1(), "Body Treatment", "hair3.png"),
    // servicesContainer(context, BodyTreatment2(), "Body Treatment", "hair4.png"),
    // ],
    // ),
    // Row(
    // mainAxisAlignment: MainAxisAlignment.spaceAround,
    // children: [
    // servicesContainer(context, Pedicure(), "Pedicure", "hair5.png"),
    // servicesContainer(context, HairCut(), "Manicure", "hair6.png"),
    // ],
    // ),
    // Row(
    // mainAxisAlignment: MainAxisAlignment.spaceAround,
    // children: [
    // servicesContainer(context, HairCut(), "Hair Spa", "hair7.png"),
    // servicesContainer(context, HairCut(), "Hand & Foot Spa", "hair8.png"),
    // ],
    // ),
    // Row(
    // mainAxisAlignment: MainAxisAlignment.spaceAround,
    // children: [
    // servicesContainer(context, HairCut(), "Massage", "hair9.png"),
    // servicesContainer(context, HairCut(), "Hair Removal", "hair10.png"),
    // ],
    // )
  }
}
