import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/sk_shop_creation.dart';

class ShopRegistration extends StatefulWidget {
  const ShopRegistration({Key? key}) : super(key: key);

  @override
  State<ShopRegistration> createState() => _ShopRegistrationState();
}

class _ShopRegistrationState extends State<ShopRegistration> {
  @override
  var height = "MediaQuery.of(context).size.height";
  var width = "MediaQuery.of(context).size.height";

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              top: MediaQuery.of(context).size.height * 0.370,
              left: MediaQuery.of(context).size.width * 0.280,
              child: Image.asset(
                "assets/logoshopregistration.png",
                scale: 4,
              )),
          Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/profilepic.png",
                    scale: 4,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                "Welcome, Hamza",
                style: TextStyle(
                  fontSize: 35,
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
              const Text(
                "Click the below Button to Register your Shop",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff474747),
                ),
              ),
              SizedBox(height:30),
              InkWell(
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ShopRegistrationForm(),));
                  },child: Image.asset("assets/registerbutton.png",scale: 4,)),
              SizedBox(height: 70),
              Image.asset("assets/Hair Fixerr bottom.png",scale: 3.5,),

            ],
          ),
        ],
      ),
    );
  }
}