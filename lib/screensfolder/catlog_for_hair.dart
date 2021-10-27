import 'package:flutter/material.dart';

class SkCatalog1 extends StatelessWidget {
  const SkCatalog1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
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
                        Text("Hair Cuts Catalog",style: TextStyle(
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
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.920,
                        height: MediaQuery.of(context).size.height * 0.330,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffF6F6F6),
                        ),
                        child: Center(
                            child: Image.asset(
                              "assets/uploadImage.png",
                              scale: 3,
                            )),
                      ),
                    ),
                    Row(
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
                    )


                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}