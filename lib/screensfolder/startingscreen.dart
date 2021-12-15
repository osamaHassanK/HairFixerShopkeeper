import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/login_screen.dart';

import 'firstscreen.dart';

class StartingScreen extends StatelessWidget {
  const StartingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else if(snapshot.hasError){
              return Center(
                child: Text("Something went wrong"),
              );
            }
            else if(snapshot.hasData){
              return FirstScreen();
            }
            return LoginScreen();
          }
        ),
  );
  }
