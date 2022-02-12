import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairfixxer_shopkeeper/Utilities/Responsive.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/loading_widget.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/appoinment_screen/appointment_screen_view_model.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/catalog_screen/EmptyCatalogWidget.dart';

import '../appointement_detail.dart';
import 'EmptyAppointmentWidget.dart';

class AttendedAppointmentWidget extends StatelessWidget {

  AppointmentScreenViewModel appointmentScreenViewModel=Get.put(AppointmentScreenViewModel());

 AttendedAppointmentWidget({Key? key,required this.appointmentScreenViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder(
        future: appointmentScreenViewModel.getAttendedAppointmentsList(),
        builder:
            (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> data) {

          if (data.connectionState == ConnectionState.waiting) {
            return LoadingWidget();
          }
          if (data.data!.docs.isEmpty) {
            return EmptyAppointmentWidget(
                onFistItemUloadSuccesfully: (data) {
                  //if (data == 'success') setState(() {});
                });
          }

          return SizedBox(
            height: Responsive.responsiveHeight(context,value: 1),
            width: double.infinity,
            child: ListView.builder(
              itemCount: 15,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xffE9E9E9),
                            borderRadius: BorderRadius.circular(10)),
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
                                Text(
                                  "Customer Name",
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  "Apointment Date",
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  "Apointment Time",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Affan Farooq",
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  "2 September,2021",
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  "12:20 PM - 2:00 AM",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
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
                                        Text(
                                          " AFFAN FAROOQ",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        Text(
                                          "VIEW PROFILE",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                      top: 10,
                                    )),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 8,
                                    ),
                                    ElevatedButton(
                                      child: Text(
                                        'SHOW DETAILS',
                                        style: TextStyle(fontSize: 9),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size(8, 30),
                                        primary: Color(0xffD7A700),
                                        onPrimary: Colors.white,
                                        shape: const BeveledRectangleBorder(
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(5))),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
