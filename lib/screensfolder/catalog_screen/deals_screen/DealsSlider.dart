import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:hairfixxer_shopkeeper/Utilities/Responsive.dart';
import 'package:hairfixxer_shopkeeper/Utilities/my_navigator.dart';
import 'package:hairfixxer_shopkeeper/auth/app_colors.dart';
import 'package:hairfixxer_shopkeeper/model/Deal.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/MyContainer.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/SetImageFromAsset.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/my_text_widget.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/create_deals_screen/CreateDealsScreen.dart';

class DealsAndDiscountSlider extends StatefulWidget {
  final Function() onTapOnNextSliderButton;
  final Function() onTapOnPreviousSliderButton;
  final Function(String docId) onTapOnDltButton;
  final Function() onTapOnUpdateButton;
  final Function() onTapOnAddButton;
  final sliderController;
  final List<dynamic> deals;

  const DealsAndDiscountSlider({
    Key? key,
    this.sliderController,
    required this.deals,
    required this.onTapOnNextSliderButton,
    required this.onTapOnPreviousSliderButton,
    required this.onTapOnAddButton,
    required this.onTapOnDltButton,
    required this.onTapOnUpdateButton,
  }) : super(key: key);

  @override
  _DealsAndDiscountSliderState createState() => _DealsAndDiscountSliderState();
}

class _DealsAndDiscountSliderState extends State<DealsAndDiscountSlider> {
  @override
  Widget build(BuildContext context) {
    return myUnResponsiveContainer(
      context: context,
      height: 500.h,
      width: Responsive.responsiveWidth(context),
      child: Column(children: [
        Expanded(
          flex: 6,
          child: CarouselSlider(
              carouselController: widget.sliderController,
              items: widget.deals
                  .asMap()
                  .map((i, deals) {
                    return MapEntry(i, Builder(
                      builder: (BuildContext context) {
                        return Stack(
                          children: [
                            sliderContainer(context, deals),
                          ],
                        );
                      },
                    ));
                  })
                  .values
                  .toList(),
              options: CarouselOptions(
                  autoPlay: false,
                  viewportFraction: 1,
                  height: 400.h,
                  enableInfiniteScroll: false)),
        ),
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    widget.onTapOnPreviousSliderButton();
                  },
                  child: myUnResponsiveContainer(
                      marginTop: 5,
                      marginRight: 5,
                      context: context,
                      width: 50,
                      height: 40,
                      child: Image.asset(
                        "assets/next1.png",
                        scale: 1,
                      )),
                ),
                InkWell(
                  onTap: () {
                    widget.onTapOnAddButton();
                  },
                  child: myUnResponsiveContainer(
                      marginTop: 5,
                      marginRight: 5,
                      context: context,
                      width: 50,
                      height: 40,
                      child: Image.asset(
                        "assets/add_new_catalog_item.png",
                        scale: 1,
                      )),
                ),
                InkWell(
                  onTap: () {
                    widget.onTapOnNextSliderButton();
                  },
                  child: myUnResponsiveContainer(
                      marginTop: 5,
                      marginLeft: 5,
                      context: context,
                      width: 50,
                      height: 40,
                      child: Image.asset(
                        "assets/next2.png",
                        scale: 1,
                      )),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Widget sliderContainer(context, dynamic deals) {
    List<dynamic> dealsList = deals['services'];
    return Stack(
      children: [
        myUnResponsiveContainer(
            elevation: 5,
            marginTop: 20.h,
            marginRight: 30.w,
            marginLeft: 30.w,
            radiusValue: 10,
            context: context,
            width: Responsive.responsiveWidth(context),
            height: 400.h,
            color: AppColor.APP_YELLOW_COLOR.withOpacity(0.5),
            child: Column(
              children: [
                myResponsiveText(
                    text: deals['dealName'],
                    textColor: Colors.black,
                    initialFontSize: 20,
                    marginTop: 8.sp,
                    weight: FontWeight.w500),

                SetImageFromAsset(

                  onTap: (){


                  },
                  height: 90.h,
                  width: 90.w,
                  marginTop: 10.h,
                  imageAddress: 'assets/chair.png',
                  fit: BoxFit.contain,
                ),
                //Image.asset('assets/chair.png',width: 80.w,height: 80.h,),

                SizedBox(
                  height: 10.h,
                ),

                Stack(
                  children: [
                    myUnResponsiveContainer(
                        elevation: 5,
                        radiusValue: 10.sp,
                        context: context,
                        height: 200.h,
                        width: Responsive.responsiveWidth(context),
                        color: Colors.black.withOpacity(0.2),
                        marginLeft: 25.w,
                        marginBottom: 5.h,
                        marginRight: 25.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        myResponsiveText(
                            text: 'Services',
                            initialFontSize: 13.sp,
                            marginTop: 20.h,
                            marginLeft: 40.w,
                            textColor: Colors.white,
                            weight: FontWeight.w500),
                        Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: myUnResponsiveContainer(
                                  marginTop: 10.h,
                                  context: context,
                                  height: 80.h,
                                  width: 40.h,
                                  child: ListView.builder(
                                      itemCount: dealsList.length,
                                      itemBuilder: (context, index) {
                                        return myResponsiveText(
                                          text: deals['services'][index],
                                          initialFontSize: 7.sp,
                                          textColor: Colors.white,
                                          marginLeft: 45.w,
                                        );
                                      }),
                                )),
                            Expanded(
                                flex: 1,
                                child: myUnResponsiveContainer(

                                  height: 30.h,
                                  marginRight: 40.w,
                                  width: 50.w,
                                  context: context,
                                  child: myResponsiveText(

                                      marginTop: 6.h,
                                      align: TextAlign.center,
                                      text: 'IN JUST ' +
                                          deals['discountedPrice'] +
                                          ' /-',
                                      initialFontSize: 6.sp,
                                      textColor: Colors.white),
                                  color: AppColor.APP_YELLOW_COLOR,
                                  radiusValue: 5.sp,
                                )),
                          ],
                        ),
                        myResponsiveText(
                            text: 'Original Price',
                            marginLeft: 40.w,
                            textColor: Colors.white,
                            initialFontSize: 11.sp,
                            weight: FontWeight.w500),
                        Stack(
                          children: [
                            myResponsiveText(
                                text: deals['originalPrice'] + ' /-',
                                textColor: Colors.white,
                                initialFontSize: 10.sp,
                                marginLeft: 45.w,
                                marginTop: 2.h),
                            SetImageFromAsset(onTap: (){

                            },
                              marginLeft: 40.w,
                              width: 30.w,
                              height: 20.h,
                              fit: BoxFit.contain,
                              imageAddress: 'assets/cross_icon.png',
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            )),

        Positioned(
            right: 40.w,
            child:
              // GestureDetector(onTap: (){
              //   print('hello');
              // },child: Image.asset('assets/dlt_icon.png',scale: 3,))
              SetImageFromAsset(
                onTap: (){

                  goToNextScreen(
                      context,
                      CreateDealsScreen(
                        deal: Deal(
                            deals.id,
                            deals['dealName'],
                            deals['originalPrice'],
                            deals['discountedPrice'],
                            dealsList as List<dynamic>),
                        isComingFromEdit: true,
                      ),reloadCallback:()=> widget.onTapOnUpdateButton());
                },
                  imageAddress: 'assets/edt_icon.png',
                  width: 30.h,
                  height: 30.h,
                  fit: BoxFit.contain,
                  marginTop: 35.h),

        ),
        Positioned(
            right: 40.w,
            child:
              // GestureDetector(onTap: (){
              //   print('hello');
              // },child: Image.asset('assets/dlt_icon.png',scale: 3,))
              SetImageFromAsset(
                onTap: (){

                  widget.onTapOnDltButton(
                      deals.id);
                },
                  imageAddress: 'assets/dlt_icon.png',
                  width: 25.h,
                  height: 25.h,
                  fit: BoxFit.contain,
                  marginTop: 66.h),

        ),
      ],
    );
  }

}
//
// Column(
// children: [
// Expanded(
// flex: 1,
// child: myResponsiveText(
// marginTop: 10,
// text: '${catalogItemData['catalogItemName']}',
// textColor: Colors.black,
// initialFontSize: 30,
// weight: FontWeight.w600,
// ),
// ),
// Expanded(
// flex: 1,
// child: myResponsiveText(
// marginTop: 0,
// text:
// '${catalogItemData['catalogItemCategory']}',
// textColor: Colors.black,
// initialFontSize: 14,
// weight: FontWeight.w400,
// ),
// ),
// Expanded(
// flex: 18,
// child: Container(
// height: 400,
// margin: EdgeInsets.only(
// right: 10, left: 10, bottom: 10),
// child: ClipRRect(
// borderRadius: BorderRadius.circular(20),
// child: CachedNetworkImage(
// progressIndicatorBuilder: (context, url,
// downloadProgress) =>
// Center(
// child:
// CircularProgressIndicator(
// color: AppColor
//     .APP_YELLOW_COLOR,
// strokeWidth: 3,
// value: downloadProgress
//     .progress)),
// imageUrl: catalogItemData[
// 'catalogItemImgUrl'],
// fit: BoxFit.cover,
// ),
// )),
// ),
// ],
// ),

////////
// Container(
// width: double.infinity,
// height: 400.h,
// child: Column(
// children: [
// CarouselSlider(
// carouselController: widget.sliderController,
// items: widget.deals
//     .asMap()
// .map((i, deals) {
// return MapEntry(i, Builder(
// builder: (BuildContext context) {
//
// List<dynamic> services=deals['services'];
// return Column(
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Container(
// height: 380,
// margin: EdgeInsets.all(1),
// child: Stack(children: [
// Image.asset(
// 'assets/dealmen.png',
// fit: BoxFit.cover,
// width: double.infinity,
// ),
// Center(
// child: Column(
// crossAxisAlignment:
// CrossAxisAlignment.center,
// children: [
// MyCustomBtn(
// width: 120.w,
// height: 37.h,
// context: context,
// btnText: deals['dealName'],
// bottomLeft: 10,
// btnTextSize: 15.0,
// bottomRight: 10,
// color: AppColor.APP_YELLOW_COLOR,
// btnTextColor: Colors.white,
// btnTextWeight: FontWeight.w600),
// SizedBox(
// height: 10,
// ),
// Container(
// height: 260.0,
// width: MediaQuery
//     .of(context)
//     .size
//     .width *
// 0.8,
// decoration: BoxDecoration(
// borderRadius:
// BorderRadius.circular(15),
// color: Colors.black26),
// child: Column(
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// Padding(
// padding: const EdgeInsets.only(
// left: 15,
// right: 15,
// top: 20),
// child: myResponsiveText(
// text: "Services",
// textColor: Colors.white,
// initialFontSize: 15.sp,
// weight: FontWeight.w600),
// ),
// Row(
// mainAxisAlignment:
// MainAxisAlignment
//     .spaceBetween,
// children: [
// Padding(
// padding:
// const EdgeInsets.only(
// left: 10),
// child: Column(
// crossAxisAlignment:
// CrossAxisAlignment
//     .start,
// children: [
// Padding(
// padding:
// const EdgeInsets
//     .only(
// left: 10),
// child:
//
//
// SizedBox(
// height: 100.h,
//
// child: Column(
// crossAxisAlignment:
// CrossAxisAlignment
//     .start,
// children: [
//
//
// SizedBox(
// height: 100.h,
// child: ListView.builder(
// itemCount: services.length
// ,
// itemBuilder: (
// context,
// index) {
// return  text(
// context,
// services[index],
// Colors.white,
// 15,
// FontWeight
//     .w500);
//
// }),
// ),
//
// ],
// ),
// ),
// ),
// SizedBox(
// height: 15,
// ),
// text(
// context,
// "Original Price",
// Colors.white,
// 15.sp,
// FontWeight.w500),
// SizedBox(
// height: 5,
// ),
// Padding(
// padding:
// const EdgeInsets
//     .only(
// left: 15),
// child: Stack(
// children: [
// text(
// context,
// '${deals['originalPrice']}',
// Color(
// 0xff3DB0F4),
// 20,
// FontWeight
//     .w600),
// imagePath(
// context,
// "cross.png",
// 1),
// ],
// ),
// ),
// ],
// ),
// ),
// Padding(
// padding:
// const EdgeInsets.only(
// top: 0, right: 15),
// child: Column(
// crossAxisAlignment:
// CrossAxisAlignment
//     .end,
// children: [
// Container(
// height: 35,
// width: 130,
// decoration: BoxDecoration(
// borderRadius:
// BorderRadius
//     .circular(
// 10),
// color: Color(
// 0xff4FA0CF)),
// child: Center(
// child: text(
// context,
// "IN JUST   ${deals['discountedPrice']}",
// Colors.white,
// 13,
// FontWeight
//     .w500)),
// ),
//
// ],
// ),
// ),
// ],
// )
// ],
// ),
// ),
// ],
// ),
// )
// ])),
// ],
// );
// },
// ));
// })
// .values
//     .toList(),
// options: CarouselOptions(
// autoPlay: false,
// viewportFraction: 1,
// height: 390,
// enableInfiniteScroll: false)),
// SizedBox(
// height: 5,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// InkWell(
// onTap: () {
// widget.onTapOnPreviousSliderButton();
// },
// child: Container(
// width: 50,
// height: 30,
// child: imagePath(context, "next1.png", 1),
// ),
// ),
// InkWell(
// onTap: () {
// widget.onTapOnNextSliderButton();
// },
// child: Container(
// width: 50,
// height: 30,
// child: imagePath(context, "next2.png", 1),
// ),
// ),
// ],
// )
// ],
// ),
// );
