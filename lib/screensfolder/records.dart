import 'package:flutter/material.dart';

import 'bottomnavigatorbar.dart';

class Records extends StatefulWidget {
  const Records({Key? key}) : super(key: key);

  @override
  _RecordsState createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child:
    SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(140.0),
          child: AppBar(
            flexibleSpace: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Image.asset(
                        "assets/backarrow.png",
                        scale:4,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: (){ Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context)=>  BottomNavigatorBar (),));
                        },
                        child: Image.asset(
                          "assets/home.png",
                          scale: 4,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 48,
                  width: double.infinity,
                  color: Color(0xffD5A300),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Men’s Beauty Salon",
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
            backgroundColor: Colors.white,
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.label ,
              unselectedLabelColor: Colors.greenAccent,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.amberAccent,
              ),
              tabs: [
                Tab(
                  child: Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "PENDING APPOINTMENTS",textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xff4B4B4B), fontSize: 15),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.transparent,
                      )),
                ),
                Tab(
                  child: Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "COMPLETED APPOINTMENTS",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xff4B4B4B), fontSize: 15),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.transparent,
                      )),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            pendingApointment(),
            completedApointment(),
          ],
        ),

      ),
    ),
    );
  }
}
 Widget pendingApointment(){
  return SizedBox(
    height: 660,
    width: double.infinity,
    child: ListView.builder(
      itemCount: 15,
      shrinkWrap: true,
      padding:
      EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.all(10),
            child:Container(
              decoration: BoxDecoration(
                color: Color(0xffE9E9E9),
                borderRadius: BorderRadius.circular(10)
              ),
             
              height: 100,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Column(
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
                    ],
                  ),
                  SizedBox(width: 5,),
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
                    ],
                  ),
                  SizedBox(width: 5,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      CircleAvatar(
                        child: Image.asset("assets/men.png"),
                        radius: 15,
                      ),
                          SizedBox(
                             width: 2,
                          ),
                          Column(
                            children: [
                              Text(" AFFAN FAROOQ",textAlign: TextAlign.start,style: TextStyle(fontSize:10),),
                              Text("VIEW PROFILE",textAlign: TextAlign.start,style: TextStyle(fontSize:10),),
                            ],
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 10,)),
                      Row(
                        children: [
                          SizedBox(width: 8,),
                          ElevatedButton(
                            child: Text('SHOW DETAILS',style: TextStyle(fontSize: 9),),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(8, 30),
                              primary: Color(0xffD7A700),
                              onPrimary: Colors.white,
                              shape: const BeveledRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5))),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),

                    ],
                  )
                ],
              ),
            ),)
          ],
        );
      },
    ),
  );
 }
Widget completedApointment(){
  return SizedBox(
    height: 660,
    width: double.infinity,
    child: ListView.builder(
      itemCount: 15,
      shrinkWrap: true,
      padding:
      EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.all(10),
              child:Container(
                decoration: BoxDecoration(
                    color: Color(0xffE9E9E9),
                    borderRadius: BorderRadius.circular(10)
                ),

                height: 100,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Column(
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
                      ],
                    ),
                    SizedBox(width: 5,),
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
                      ],
                    ),
                    SizedBox(width: 5,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              child: Image.asset("assets/men.png"),
                              radius: 15,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Column(
                              children: [
                                Text(" AFFAN FAROOQ",textAlign: TextAlign.start,style: TextStyle(fontSize:10),),
                                Text("VIEW PROFILE",textAlign: TextAlign.start,style: TextStyle(fontSize:10),),
                              ],
                            )
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 10,)),
                        Row(
                          children: [
                            SizedBox(width: 8,),
                            ElevatedButton(
                              child: Text('SHOW DETAILS',style: TextStyle(fontSize: 9),),
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(8, 30),
                                primary: Color(0xffD7A700),
                                onPrimary: Colors.white,
                                shape: const BeveledRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5))),
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),

                      ],
                    )
                  ],
                ),
              ),)
          ],
        );
      },
    ),
  );
}