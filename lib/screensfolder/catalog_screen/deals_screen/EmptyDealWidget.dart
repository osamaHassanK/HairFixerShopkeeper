import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:hairfixxer_shopkeeper/Utilities/my_navigator.dart';
import 'package:hairfixxer_shopkeeper/auth/app_colors.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/MyContainer.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/my_text_widget.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/create_deals_screen/CreateDealsScreen.dart';
import 'package:lottie/lottie.dart';

class EmptyDealWidget extends StatefulWidget {
  Function()? onFistItemUloadSuccesfully;

   EmptyDealWidget({Key? key,this.onFistItemUloadSuccesfully}) : super(key: key);

  @override
  _EmptyDealWidgetState createState() => _EmptyDealWidgetState();
}

class _EmptyDealWidgetState extends State<EmptyDealWidget> {
  @override
  Widget build(BuildContext context) {
    return myContainer(
      context: context,
      height: 1,
      width: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset("assets/animations/empty_catalog_animation.json",
              width: 300, height: 300),
          myResponsiveText(
              marginRight: 20,
              marginLeft: 20,
              text: 'You Do Not Have Any Deal',
              align: TextAlign.start,
              textColor: AppColor.APP_YELLOW_COLOR,
              weight: FontWeight.bold,
              initialFontSize: 25),
          InkWell(
            onTap: () async {

              goToNextScreen(context, CreateDealsScreen(),reloadCallback: ()=> widget.onFistItemUloadSuccesfully!());
             // var data = await Get.to(CreateDealsScreen());
             // widget.onFistItemUloadSuccesfully!(data);
              // goToNextScreen(context, CreateCatalogScreen(),
              //     reloadCallback: () {
              //   setState(() {});
              // });
            },
            child: myResponsiveText(
                text: 'CREATE DEAL',
                align: TextAlign.start,
                textColor: Color(0xff4D4D4D),
                weight: FontWeight.bold,
                initialFontSize: 20),
          ),
        ],
      ),
    );
  }
}
