import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DetailOfAppointment extends StatefulWidget {
  const DetailOfAppointment({Key? key}) : super(key: key);

  @override
  _DetailOfAppointmentState createState() => _DetailOfAppointmentState();
}

class _DetailOfAppointmentState extends State<DetailOfAppointment> {
  var shopName="Men's Beauty Saloon";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          body:Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/backarrow.png",scale: 4,),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset("assets/notification.png",scale: 4,),
                        SizedBox(width: 5,),
                        Image.asset("assets/settingicon.png",scale: 4,)

                      ],
                    )
                  ],),
              ),
              Container(
                color: Color(0xffD5A300),
                height: 50,
                width: double.infinity,
                child:Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(shopName,textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,fontSize: 23,fontWeight: FontWeight.bold,
                    ),),
                )

              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  SizedBox(width: 5,),
                  const Text("APPOINTMENT DETAILS",style: TextStyle(
                    fontSize: 20,fontWeight: FontWeight.bold,
                  ),),
                ],
              ),
              Container(
                width: double.infinity,
                height: 330,
                color: Color(0xffF8F8F8),
                child: Column(
                  children: [
                    SizedBox(
                      height:5,
                    ),
                    Row(
                      children: [
                        SizedBox(width: MediaQuery.of(context).size.height*0.1,),
                        CircleAvatar(
                          child: Image.asset("assets/men.png",),
                          radius: 25,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(" AFFAN FAROOQ",textAlign: TextAlign.start,style: TextStyle(fontSize:18),),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width:7,),
                                Text("VIEW PROFILE",textAlign: TextAlign.start,style: TextStyle(fontSize:10),),
                              ],
                            )

                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                      SizedBox(width: 18,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text("Customer Name",style: TextStyle(
                              fontSize: 12
                          ),),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text("Apointment Date",style: TextStyle(
                              fontSize: 12
                          ),),

                          SizedBox(
                            height: 8.0,
                          ),
                          Text("Apointment Time",  style: TextStyle(
                              fontSize: 12
                          ),),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text("Appointment Status",  style: TextStyle(
                              fontSize: 12
                          ),),
                        ],
                      ),
                      SizedBox(width: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text("Affan Farooq",
                            style: TextStyle(
                                fontSize: 12
                            ),),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text("2 September,2021",style: TextStyle(
                              fontSize: 12
                          ),),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text("12:20 PM - 2:00 AM",style: TextStyle(
                              fontSize: 12
                          ),),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text("Pending",style: TextStyle(
                              fontSize: 12
                          ),),
                        ],
                      ),
                    ],
                    ),
                    Padding(padding:EdgeInsets.all(8),
                    child:
                    Container(
                      height: 155.0,
                      width: double.infinity,
                      color: Color(0xffE9E9E9),
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text("Services",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
                             SizedBox(width: 100,),
                             Text("PRICE",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600)),
                           ],
                          ),
                          Padding(padding:EdgeInsets.only(right: 10,left: 10,top: 5),
                           child: Container(
                             color: Colors.grey,
                             height: 1,
                             width: double.infinity,
                           ) ,),
                          Padding(padding: EdgeInsets.all(8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Hair Cut",style: TextStyle(color: Colors.black,fontSize: 13),),
                              SizedBox(width: 100,),
                              Text("30Rs",style: TextStyle(color: Colors.black,fontSize: 13)),
                            ],
                          ),),
                          Padding(padding:EdgeInsets.only(right: 10,left: 10,top: 5),
                            child: Container(
                              color: Colors.grey,
                              height: 1,
                              width: double.infinity,
                            ) ,),
                          Padding(padding: EdgeInsets.all(8),
                            child:Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Shave",style: TextStyle(color: Colors.black,fontSize: 13),),
                                SizedBox(width: 110,),
                                Text("15Rs",style: TextStyle(color: Colors.black)),
                              ],
                            ),),
                          Padding(padding:EdgeInsets.only(right: 8,left: 8,top: 5),
                            child: Container(
                              color: Colors.grey,
                              height: 1,
                              width: double.infinity,
                            ) ,),
                          Row(
                            children: [
                              SizedBox(width: MediaQuery.of(context).size.width*0.2,),
                              Text("Total Amount",style: TextStyle(fontSize: 13,color: Color(0xffAC8918)),),
                              Text("45 \$",style: TextStyle(fontSize: 13),),

                            ],
                          )

                        ],
                      ),
                    ),
                    )
                  ],
                ),
              ),
           ]
          )
          ),
    );
  }
}
