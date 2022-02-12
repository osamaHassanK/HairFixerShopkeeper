import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/bottom_navigation_bar/bottom_navigator_bar.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/catalog_screen/CatalogScreen.dart';


class EditCatalog extends StatefulWidget {
  const EditCatalog({Key? key}) : super(key: key);

  @override
  _EditCatalogState createState() => _EditCatalogState();
}

class _EditCatalogState extends State<EditCatalog> {
  CarouselController carouselController1 = CarouselController();
  CarouselController carouselController2 = CarouselController();

  final deals = [
    {
      'title': "Hair and Cut",
      'image': "assets/dealmen.png",
      'text1': ("Save \$5 in each and every"),
      'label1': ("Men's Fade Hair Cut"),
      'label2': ("HC 3456"),
    },
    { 'title': "Beard Style Catalog",
      'image': "assets/dealmen.png",
      'label1': ("Circle Beard"),
      'label2': ("HC 6789"),
    },
    {
      'title': "Facial and skincare Catalog",
      'image': "assets/dealmen.png",
      'label1': ("Myofascial Massage"),
      'label1': ("HC 8976"),

    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => CatalogScreen()),
                                  (route) => true);
                        },
                        child: Image.asset(
                          "assets/backarrow.png",
                          scale: 4,
                        )),
                    InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => BottomNavigatorBar()),
                                (route) => false);
                      },
                      child: Image.asset(
                        "assets/home.png",
                        scale: 4,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text("Men's Beauty Saloon",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 21,
                        fontWeight: FontWeight.w900)),
              ),
              SizedBox(
                height: 5,
              ),
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 540,
                    color: Colors.white,
                    child: Column(
                      children: [
                        CarouselSlider(
                            carouselController: carouselController2,
                            items: deals
                                .asMap()
                                .map((i, deals) {
                              return MapEntry(i, Builder(
                                builder: (BuildContext context) {
                                  return Column(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 45,
                                        decoration: BoxDecoration(color: Color(0xffD5A300)),
                                        child: Center(
                                            child: Text(
                                              '${deals['title']}',
                                              style: TextStyle(
                                                  color: Colors
                                                      .white,
                                                  fontSize:
                                                  20,
                                                  fontWeight:
                                                  FontWeight
                                                      .w800),
                                            ),),
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            children: const [
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(left: 20.0,right: 8,top: 8),
                                                child: Text(
                                                  "Name",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, left: 30, right: 30, bottom: 10),
                                            child: TextFormField(
                                                decoration: InputDecoration(
                                                  labelText: '${deals['label1']}',labelStyle: TextStyle(fontSize: 13),
                                                  filled: true,
                                                  fillColor: Color(0xffF6F6F6),
                                                  contentPadding: const EdgeInsets.only(
                                                      left: 14.0, bottom: 6.0, top: 8.0),
                                                  enabledBorder: OutlineInputBorder(
                                                      borderSide:
                                                      BorderSide(color: Colors.transparent),
                                                      borderRadius: BorderRadius.circular(10)),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                      borderSide: BorderSide(color: Colors.transparent)),

                                                )),
                                          ),
                                          Row(
                                            children: const [
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(left: 20.0),
                                                child: Text(
                                                  "Description",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black, //(0xff474747),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, left: 30, right: 30),
                                            child:
                                            TextFormField(
                                                decoration: InputDecoration(
                                                  labelText:'${deals['label2']}',
                                                  labelStyle: TextStyle(fontSize: 13),
                                                  filled: true,
                                                  fillColor: Color(0xffF6F6F6),
                                                  contentPadding: const EdgeInsets.only(
                                                      left: 14.0, bottom: 6.0, top: 8.0),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.transparent),
                                                    borderRadius: BorderRadius.circular(10.0),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                      borderSide: BorderSide(color: Colors.transparent)),
                                                )),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 12.0,left: 8.0),
                                            child: Row(
                                              children: const [
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(left: 18.0),
                                                  child: Text(
                                                    "Image",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black, //(0xff474747),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8.0,top: 8,right: 8,),
                                            child: Container(
                                              width: MediaQuery.of(context).size.width * 0.850,
                                              height: MediaQuery.of(context).size.height * 0.300,
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
                                        ],
                                      )
                                    ],
                                  );
                                },
                              ));
                            })
                                .values
                                .toList(),
                            options: CarouselOptions(
                                autoPlay: false,
                                viewportFraction: 1,
                                height: 500,
                                enableInfiniteScroll: false)),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                carouselController2.previousPage();
                              },
                              child: Container(
                                  width: 50,
                                  height: 30,
                                  child: Image.asset(
                                    "assets/next1.png",
                                    scale: 1,
                                  )),
                            ),
                            InkWell(
                              onTap: () {
                                carouselController2.nextPage();
                              },
                              child: Container(
                                  width: 50,
                                  height: 30,
                                  child: Image.asset(
                                    "assets/next2.png",
                                    scale: 1,
                                  )),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                child: Text(' Cancel ',style: TextStyle(fontSize: 15),),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffD7A700),
                  onPrimary: Colors.white,
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ), onPressed: () {  },
              ),
              ElevatedButton(
                child: Text(' Save changes ',style: TextStyle(fontSize: 15),),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffD7A700),
                  onPrimary: Colors.white,
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ), onPressed: () {  },
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
