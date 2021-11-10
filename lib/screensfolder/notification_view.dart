import 'package:flutter/material.dart';
import 'package:hairfixxer_shopkeeper/base.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  _NotificationViewState createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          topIcon(context,"backarrow.png","home.png"),
          topTitle(context, "Notification"),

        ],
      ),
    );
  }
}
