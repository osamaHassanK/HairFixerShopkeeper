import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:hairfixxer_shopkeeper/Utilities/Checker.dart';
import 'package:hairfixxer_shopkeeper/Utilities/my_navigator.dart';
import 'package:hairfixxer_shopkeeper/shop%20creation%20pages/create_shop_screen.dart';

class ShopRegistration extends StatefulWidget {
  const ShopRegistration({Key? key}) : super(key: key);

  @override
  State<ShopRegistration> createState() => _ShopRegistrationState();
}

class _ShopRegistrationState extends State<ShopRegistration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
                top: MediaQuery.of(context).size.height * 0.370,
                left: MediaQuery.of(context).size.width * 0.280,
                child: Image.asset(
                  "assets/logoshopregistration.png",
                  scale: 4,
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    getShopKeeperImageUrl(),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Welcome $shopKeeperName',
                  style: TextStyle(
                    fontSize: 25,
                    color: Color(0xffD7A600),
                  ),
                ),
                SizedBox(
                  height: 90,
                ),
                const Text(
                  "it seems you didn't have",
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xff474747),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                const Text(
                  "registered your shop",
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xff474747),
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                AutoSizeText(
                  "Click the below Button to Register your Shop",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff474747),
                  ),
                  maxLines: 1,
                ),
                SizedBox(height: 30),
                InkWell(
                    onTap: () {
                      goToNextScreen(context, ShopRegistrationForm());
                    },
                    child: Image.asset(
                      "assets/registerbutton.png",
                      scale: 4,
                    )),
                SizedBox(height: 70),
                Image.asset(
                  "assets/Hair Fixerr bottom.png",
                  scale: 3.5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
