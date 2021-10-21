import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: SafeArea(
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(145.0),
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
                            scale: 4,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Image.asset(
                            "assets/home.png",
                            scale: 4,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      color: Color(0xffD5A300),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Notification",
                          style: TextStyle(fontSize: 28),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
                backgroundColor: Colors.white,
                bottom: TabBar(
                  unselectedLabelColor: Colors.greenAccent,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.amberAccent,
                  ),
                  tabs: [
                    Tab(
                      child: Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "All",
                              style: TextStyle(
                                  color: Color(0xff4B4B4B), fontSize: 16),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.transparent,
                          )),
                    ),
                    Tab(
                      child: Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Read",
                              style: TextStyle(
                                  color: Color(0xff4B4B4B), fontSize: 16),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.transparent,
                          )),
                    ),
                    Tab(
                      child: Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Unread",
                              style: TextStyle(
                                  color: Color(0xff4B4B4B), fontSize: 15),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.transparent,
                          )),
                    ),
                    Tab(
                      child: Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Clear All",
                              style: TextStyle(
                                  color: Color(0xff4B4B4B), fontSize: 16),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.transparent,
                          )),
                    ),
                  ],
                ),
              ),
            ),
            body: TabBarView(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [

                      SizedBox(
                        height: 650,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: 15,
                          shrinkWrap: true,
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
//Navigator.pushNamed(context, '/message');
                                    },
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 110,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black12
                                                      .withOpacity(0.2),
                                                  blurRadius: 1,
                                                  offset: const Offset(0, 5)),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Color(0xffF6F6F6)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10,
                                                              top: 20),
                                                      child: CircleAvatar(
                                                          radius: 35,
                                                          backgroundImage:
                                                              AssetImage(
                                                                  "assets/men.png")),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "CROP Salon",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xffD5A300),
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                      Text(
                                                        "Service Provider",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black54,
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 5,
                                                                left: 10),
                                                        child: Text(
                                                          "Congratulations!\nYour appointment is approaved.\nclick here to see the apointment\ndetails...........  ",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black45,
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 30,
                                                  ),
                                                  Image.asset(
                                                    "assets/msg.png",
                                                    scale: 3,
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "Mark as Read",
                                                    style: TextStyle(
                                                        color: Colors.black45,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                  SizedBox(
                                                    height: 22,
                                                  ),
                                                  Text(
                                                    "23/8/21",
                                                    style: TextStyle(
                                                        color: Colors.black45,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Text('hello'),
                Text('hello'),
                Text('hello'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
