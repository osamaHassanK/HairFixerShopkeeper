import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairfixxer_shopkeeper/auth/app_colors.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/MyContainer.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/my_text_widget.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/create_catalog_screen/CreateCatalogScreen.dart';
import 'package:lottie/lottie.dart';

class EmptyAppointmentWidget extends StatefulWidget {
  Function(String data)? onFistItemUloadSuccesfully;
   EmptyAppointmentWidget({Key? key, this.onFistItemUloadSuccesfully}) : super(key: key);

  @override
  _EmptyAppointmentWidgetState createState() => _EmptyAppointmentWidgetState();
}

class _EmptyAppointmentWidgetState extends State<EmptyAppointmentWidget> {
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
          Lottie.asset("assets/animations/no_appointment.json",
              width: 300, height: 300),
          myResponsiveText(
              marginRight: 20,
              marginLeft: 20,
              text: 'No Appointments Records Available',
              align: TextAlign.start,
              textColor: Colors.black,
              weight: FontWeight.bold,
              initialFontSize: 25),
//           InkWell(
//             onTap: () async {
//             var data=  await Get.to(CreateCatalogScreen());
// widget.onFistItemUloadSuccesfully!(data);
//               // goToNextScreen(context, CreateCatalogScreen(),
//               //     reloadCallback: () {
//               //   setState(() {});
//               // });
//             },
//             child: myResponsiveText(
//                 text: 'Create Catalog',
//                 align: TextAlign.start,
//                 textColor: Color(0xff4D4D4D),
//                 weight: FontWeight.bold,
//                 initialFontSize: 20),
//           ),
        ],
      ),
    );
  }
}
