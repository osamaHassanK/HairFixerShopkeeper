import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/my_text_widget.dart';

class MyCard extends StatelessWidget {
  String text;
  String image;
  Function( ) onClicked;
   MyCard({Key? key,this.text='',this.image='',required this.onClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=> onClicked(),
      child: Container(
        width: 150 ,
        height: 150,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.white,
          elevation: 10,
          child: Column(
            children: [
              SizedBox(
                height: 05,

              ),
              Image.asset('assets/'+ image,fit: BoxFit.contain,height: 100,width: 100,),
              SizedBox(
                height: 05,

              ),
              myResponsiveText(text: text, textColor: Colors.black,maxLines: 1,initialFontSize: 12)

            ],
          ),
        ),
      ),
    );
  }
}
