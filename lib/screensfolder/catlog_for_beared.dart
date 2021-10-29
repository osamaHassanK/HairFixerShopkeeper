import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class Catalog2 extends StatefulWidget {
  const Catalog2({Key? key}) : super(key: key);

  @override
  _Catalog2State createState() => _Catalog2State();
}

class _Catalog2State extends State<Catalog2> {

  final ImagePicker _picker= ImagePicker();
  XFile? image3;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:SingleChildScrollView(
          child: Column(
              children: [
          Padding(
          padding: const EdgeInsets.only(top: 15.0,right: 15,left: 15,bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/backarrow.png",scale: 4,),
              Image.asset("assets/settingicon.png",scale: 4,),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height*0.070,
          color: Color(0xffD6A600),
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text("Create your Catalog",
              style:TextStyle(fontSize: 25,color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
          Row(
          children: const [
          Text("Beared Style Catalog",style: TextStyle(
              color: Colors.black,fontSize: 23,fontWeight: FontWeight.bold
          ),
          ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          children: [ Text("Name",style: TextStyle(fontSize: 16,color: Colors.black),)],
        ),
        TextFormField(
            decoration: InputDecoration(
              alignLabelWithHint: false,
              labelText: "e.g Circle Beared",
              filled: true,
              fillColor: Color(0xffF6F6F6),
              contentPadding: const EdgeInsets.only(
                  left: 14.0, bottom: 6.0, top: 8.0),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10.0),
              ),
            )),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: const [ Text("Description",
            style: TextStyle(fontSize: 16,color: Colors.black),)],
        ),
        TextFormField(
            decoration: InputDecoration(
              alignLabelWithHint: false,
              labelText: "e.g HC 8987",
              filled: true,
              fillColor: Color(0xffF6F6F6),
              contentPadding: const EdgeInsets.only(
                  left: 14.0, bottom: 6.0, top: 8.0),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10.0),
              ),
            )),
        SizedBox(
          height: 15,
        ),

        Row(
          children: [ Text("Image",style: TextStyle(fontSize: 16,color: Colors.black),)],
        ),
        Padding(
          padding: EdgeInsets.only(left: 30.0, right: 30, top: 8),
          child:  Container(
              width: double.infinity,
              height: 200,
              color: Colors.transparent,
              child:Stack(
                children: [
                  InkWell(
                    onTap: (){
                      filePicker();
                    },
                    child: Center(
                      child:
                      Image.asset("assets/uploadImage.png",scale: 4,),
                    ),
                  ),image3 == null ?Text("No image Found"):Image.file(File("selectimage!.path"),
                    width: double.infinity,
                    fit: BoxFit.fitHeight,
                  )
                ],
              )
          ),
        )],

        ),
      ),
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20, top: 8),

                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      child: Text('+ Add ',style: TextStyle(fontSize: 18),),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffD7A700),
                        onPrimary: Colors.white,
                        shape: const BeveledRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                      onPressed: () {},
                    ),
                    ElevatedButton(
                      child: Text(' Done ',style: TextStyle(fontSize: 18),),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffD7A700),
                        onPrimary: Colors.white,
                        shape: const BeveledRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                      onPressed: () {},
                    ),


                  ],
                ),

              )
      ],
    ),
    ),
    ),
    );
  }
  void filePicker()async{
    final XFile? selectimage = await _picker.pickImage(source:ImageSource.gallery);
    print(selectimage!.path);
    setState(() {
      image3=selectimage;
    });
  }
}

