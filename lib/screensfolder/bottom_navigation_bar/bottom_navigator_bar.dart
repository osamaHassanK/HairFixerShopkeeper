import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:hairfixxer_shopkeeper/profile%20screen/profile.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/catalog_screen/CatalogAndDealTabBar.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/catalog_screen/CatalogScreen.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/appoinment_screen/appoinment_screen.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/homescreen.dart';
class BottomNavigatorBar extends StatefulWidget {

  static final List<Widget>_widgetOptions=<Widget>[
    SkHomeScreen(),
   CatalogAndDealTabBar(),
    AppointmentScreen(),
    Profile(),
  ];

  @override
  State<BottomNavigatorBar> createState() => _BottomNavigatorBarState();
}

class _BottomNavigatorBarState extends State<BottomNavigatorBar> {
  int _selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: BottomNavigatorBar._widgetOptions.elementAt(_selectedIndex),
          bottomNavigationBar: BottomNavyBar(
            selectedIndex: _selectedIndex,
            onItemSelected: (index) => setState(() {
              _selectedIndex = index;
            }),
            items: [
              BottomNavyBarItem(
                icon: Icon(Icons.home_outlined,size: 28,),
                title: Text('Home'),
                activeColor: Color(0xffCF9B00),
              ),
              BottomNavyBarItem(
                  icon: Icon(Icons.home_repair_service,size: 28,),
                  title: Text('Catalog'),
                activeColor: Color(0xffCF9B00),
              ),
              BottomNavyBarItem(
                  icon: Icon(Icons.access_time,size: 25,),
                  title: Text('Appointment',style: TextStyle(fontSize: 13),),
                activeColor: Color(0xffCF9B00),
              ),
              BottomNavyBarItem(
                  icon: Icon(Icons.account_circle,size: 28,),
                  title: Text('Profile'),
                activeColor: Color(0xffCF9B00),
              ),
            ],
          )
      ),
    );
  }
}
