import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairfixxer_shopkeeper/auth/app_colors.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/MyContainer.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/my_text_widget.dart';
class ServicesDesignContainerWidget extends StatelessWidget {
   ServicesDesignContainerWidget({Key? key,required this.context,required this.text,required this.imageName}) : super(key: key);
  BuildContext context;
  //var CatalogItemDetailScreen;
      String text;
      String imageName;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
         // Get.to(CatalogItemDetailScreen);
          // Navigator.pushAndRemoveUntil(
          //     context,
          //     MaterialPageRoute(builder: (builder) => CatalogItemDetailScreen),
          //         (route) => false);
        },
        child: myContainer(
          context: context,
          radiusValue: 5,
          color: Colors.white,
          height: 0.2,
          width: 1,
          child: Column(
            children: [
//temparary
              Image.asset(imageName,width: 140.w,height: 100.h,),

              myResponsiveText(
                  text: text,
                  textColor: AppColor.DARK_GREY_TEXT_COLOR,
                  initialFontSize: 15,
                  weight: FontWeight.w600,marginBottom: 3),
              // setImage(imageName,
              //     height: 100.h, width: 140.w, cornerRadius: 10.0),
            ],
          ),
        ));
  }
   Widget setImage(image,
       {cornerRadius = 0.0, scale = 0.0, width = 0.0, height = 0.0}) {
     if (image == "" || image == null) {
       return ClipRRect(
           borderRadius: BorderRadius.circular(cornerRadius),
           child: Image.asset(
             'assets/img_placeholder1.png',
             scale: 15,
           ));
     } else {
       return Container(
         clipBehavior: Clip.antiAlias,
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(cornerRadius),
         ),
         width: width,
         height: height,
         child: CachedNetworkImage(
           progressIndicatorBuilder: (context, url, downloadProgress) => Center(
               child: CircularProgressIndicator(
                   color: AppColor.APP_YELLOW_COLOR,
                   strokeWidth: 3,
                   value: downloadProgress.progress)),
           imageUrl: image,
           fit: BoxFit.cover,
         ),
       );
     }
   }
}
