import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/MyContainer.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return myContainer(
      height: 1,
      child: Center(

          child:SpinKitWave(
            color: Colors.amber,
            size: 50,


          )


      ), context: context,


    );
  }
}
