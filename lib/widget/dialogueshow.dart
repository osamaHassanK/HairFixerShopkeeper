import 'package:flutter/material.dart';

import '../base.dart';

dialogBox(BuildContext context) {
  AlertDialog alert = AlertDialog(
    title: Center(child: Text("Confirm Appointment",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.blue),)),
    actions: [
      Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 150,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black12.withOpacity(0.2),
                    blurRadius: 1,
                    offset: const Offset(0, 5)),
              ],
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffF6F6F6)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Services",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Price",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.black26,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Hair Cut",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "30\$",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.black26,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Shave",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "15\$",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.black26,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: Text(
                      "Total Amount 45\$",
                      style: TextStyle(
                          color: Color(0xff1289D9),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){ Navigator.pop(context);},
            child: button(context, "Cancel", 90, 35, 10, 16, FontWeight.w600,),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
              onTap: (){
                Navigator.pop(context);
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Column(
                          children: [
                            Text(
                              "Your Appointment Request has been sent to Shop Keeper!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,fontSize: 16,color: Colors.blue
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "You will notify you after the request is approved",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,fontSize: 13,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: button(context, "Close", 90, 35, 10, 16, FontWeight.w600)),
                          ],
                        ),
                      );
                    });
              },
              child: button(context, "Confirm", 90, 35, 10, 16, FontWeight.w600))
        ],
      ),
      SizedBox(
        height: 10,
      ),
    ],
  );
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}