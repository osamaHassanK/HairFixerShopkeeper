import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hairfixxer_shopkeeper/auth/googlesigninprovider.dart';
import 'package:provider/provider.dart';


class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width:MediaQuery.of(context).size.width,
              height:MediaQuery.of(context).size.height,
              child: Image.asset("assets/screen.png",fit: BoxFit.cover,),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height*0.350,
              left:MediaQuery.of(context).size.width*0.3,

              child:Image.asset("assets/Union.png",scale:4.5),),
            Positioned(
              top: MediaQuery.of(context).size.height*0.6,
              left:MediaQuery.of(context).size.width*0.6,

              child:TextButton(
                child: Text('logout'),
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context,listen:false);
                  provider.logout();
                },)),
          ],
        )
      ),
    );
  }
}
