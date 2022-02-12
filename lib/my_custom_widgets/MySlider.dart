import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairfixxer_shopkeeper/auth/app_colors.dart';
import 'package:hairfixxer_shopkeeper/model/CatalogItem.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/MyContainer.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/create_catalog_screen/CreateCatalogScreen.dart';

import 'my_text_widget.dart';

class MySlider extends StatefulWidget {
  final Function() onTapOnNextSliderButton;
  final Function() onTapOnPreviousSliderButton;
  final Function() onAddNewItem;
  final Function(String data) onTapOnEditIcon;
  final Function(String docId) onTapOnDltIcon;
  final sliderController;
  final List<DocumentSnapshot> dataList;

  const MySlider(
      {Key? key,
      this.sliderController,
      required this.dataList,
      required this.onTapOnNextSliderButton,
      required this.onTapOnPreviousSliderButton,
      required this.onAddNewItem,
      required this.onTapOnEditIcon,
      required this.onTapOnDltIcon})
      : super(key: key);

  @override
  _MySliderState createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        flex: 15,
        child: CarouselSlider(
            carouselController: widget.sliderController,
            items: widget.dataList
                .asMap()
                .map((i, catalogItemData) {
                  return MapEntry(i, Builder(
                    builder: (BuildContext context) {
                      return Stack(
                        children: [
                          Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: myResponsiveText(
                                  marginTop: 10,
                                  text: '${catalogItemData['catalogItemName']}',
                                  textColor: Colors.black,
                                  initialFontSize: 30,
                                  weight: FontWeight.w600,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: myResponsiveText(
                                  marginTop: 0,
                                  text:
                                      '${catalogItemData['catalogItemCategory']}',
                                  textColor: Colors.black,
                                  initialFontSize: 14,
                                  weight: FontWeight.w400,
                                ),
                              ),
                              Expanded(
                                flex: 18,
                                child: Container(
                                    height: 400,
                                    margin: EdgeInsets.only(
                                        right: 10, left: 10, bottom: 10),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: CachedNetworkImage(
                                        progressIndicatorBuilder: (context, url,
                                                downloadProgress) =>
                                            Center(
                                                child:
                                                    CircularProgressIndicator(
                                                        color: AppColor
                                                            .APP_YELLOW_COLOR,
                                                        strokeWidth: 3,
                                                        value: downloadProgress
                                                            .progress)),
                                        imageUrl: catalogItemData[
                                            'catalogItemImgUrl'],
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: myUnResponsiveContainerWithBottomRadius(
                                context: context,
                                width: double.infinity,
                                height: 60,
                                color: Colors.black.withOpacity(0.4),
                                bottomLeftRadius: 18,
                                bottomRightRadius: 18,
                                marginRight: 10,
                                marginLeft: 10,
                                marginBottom: 10,
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: myResponsiveText(
                                            marginLeft: 10,
                                            text: 'Price:',
                                            initialFontSize: 17,
                                            textColor:
                                                AppColor.APP_YELLOW_COLOR,
                                            weight: FontWeight.w500)),
                                    Expanded(
                                        flex: 5,
                                        child: myResponsiveText(
                                            marginLeft: 5,
                                            text: catalogItemData[
                                                'catalogItemPrice'],
                                            initialFontSize: 16,
                                            textColor: Colors.white,
                                            weight: FontWeight.w300)),
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () async {
                                          var data = await Get.to(() =>
                                              CreateCatalogScreen(
                                                wantToUpdateItem: true,
                                                docId: widget.dataList[i].id,
                                                catalogItemData:
                                                    CatalogItem.withOneLessArg(
                                                  catalogItemData[
                                                      'catalogItemName'],
                                                  catalogItemData[
                                                      'catalogItemPrice'],
                                                  catalogItemData[
                                                      'catalogItemCategory'],
                                                  catalogItemData[
                                                      'catalogItemImgUrl'],
                                                ),
                                              ));
                                          widget.onTapOnEditIcon(data);
                                        },
                                        child: Image.asset(
                                          "assets/edt_icon.png",
                                          scale: 4,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () {
                                          widget.onTapOnDltIcon(
                                              widget.dataList[i].id);
                                        },
                                        child: Image.asset(
                                          "assets/dlt_icon.png",
                                          scale: 4,
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          )
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
                height: 550,
                enableInfiniteScroll: false)),
      ),
      Expanded(
        flex: 1,
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
                widget.onAddNewItem();
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
      )
    ]);
  }
}
