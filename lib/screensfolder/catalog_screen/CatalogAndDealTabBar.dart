import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairfixxer_shopkeeper/auth/app_colors.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/MyContainer.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/my_text_widget.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/catalog_screen/CatalogScreen.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/catalog_screen/deals_screen/DealScreen.dart';
class CatalogAndDealTabBar extends StatelessWidget {
  const CatalogAndDealTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(65.0),
            child: AppBar(
              backgroundColor: AppColor.APP_YELLOW_COLOR,
              bottom: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.amberAccent,
                tabs: [
                  Tab(
                    height: 50.h,
                    child: Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: myResponsiveText(
                            maxLines: 2,
                            text: "My Catalog",
                            align: TextAlign.center,
                            textColor: Color(0xff4B4B4B),
                            initialFontSize: 10,
                            weight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Tab(
                    height: 50.h,
                    child: Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: myResponsiveText(
                            maxLines: 2,
                            text: "My Deals",
                            align: TextAlign.center,
                            textColor: Color(0xff4B4B4B),
                            initialFontSize: 5,
                            weight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Stack(
            children: [
              myContainer(
                context: context,
                child: Opacity(
                    opacity: 0.35,
                    child: Image.asset(
                      'assets/home_screen_bg.png',
                      fit: BoxFit.cover,
                    )),
                height: 1,
                width: 1,
              ),
              TabBarView(
                children: [
                  CatalogScreen(),
                  DealScreen(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
