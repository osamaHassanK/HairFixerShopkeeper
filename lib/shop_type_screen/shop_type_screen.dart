import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairfixxer_shopkeeper/Utilities/Checker.dart';
import 'package:hairfixxer_shopkeeper/Utilities/Responsive.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/MyContainer.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/my_card.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/my_text_widget.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/create_shop_screen/shop_registration_reminder_screen.dart';

class ShopTypeScreen extends StatefulWidget {
  const ShopTypeScreen({Key? key}) : super(key: key);

  @override
  _ShopTypeScreenState createState() => _ShopTypeScreenState();
}

class _ShopTypeScreenState extends State<ShopTypeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
        child: Stack(
          children: [
            myContainer(
              context: context,
              child: Opacity(
                  opacity: 1.0,
                  child: Image.asset(
                    'assets/shop_type_screen_top_shapre.png',
                    fit: BoxFit.cover,
                  )),
              height: 0.4,
              width: 1,
            ),
            myContainer(
              context: context,
              child: Opacity(
                  opacity: 0.3,
                  child: Image.asset(
                    'assets/home_screen_bg.png',
                    fit: BoxFit.cover,
                  )),
              height: 1,
              width: 1,
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  getShopKeeperImageUrl(),
                  const SizedBox(
                    height: 8,
                  ),
                  myResponsiveText(
                      text: "What do you want to create?",
                      textColor: Colors.black,
                      initialFontSize: 17,
                      weight: FontWeight.w700,
                      maxLines: 1),
                  SizedBox(
                    height: Responsive.responsiveHeight(context, value: 0.21),
                  ),
                  MyCard(
                    image: 'men_hair_saloon_shop_icon@3x.png',
                    text: 'Men Hair Saloon',
                    onClicked: () {
                      Get.to(ShopRegistration());

                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MyCard(
                    image: 'woman_beauty_parlor_shop_icon.png',
                    text: 'Beauty Parlor',onClicked: (){


                    Get.to(ShopRegistration());
                  },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
