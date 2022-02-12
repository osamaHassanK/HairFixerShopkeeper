import 'package:flutter/material.dart';
import 'package:hairfixxer_shopkeeper/auth/app_colors.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/MyContainer.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/my_text_widget.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/appoinment_screen/appointment_screen_view_model.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/appoinment_screen/attended_appointment_widget.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/appoinment_screen/pending_appointment_widget.dart';
class AppointmentScreen extends StatelessWidget {
  AppointmentScreen({Key? key}) : super(key: key);
  final viewModel = AppointmentScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(65.0),
            child: AppBar(
              backgroundColor: AppColor.APP_YELLOW_COLOR,
              bottom: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.amberAccent,
                tabs: [
                  Tab(
                    height: 60,
                    child: Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: myResponsiveText(
                            maxLines: 2,
                            text: "PENDING \n APPOINTMENTS",
                            align: TextAlign.center,
                            textColor: Color(0xff4B4B4B),
                            initialFontSize: 10,
                            weight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Tab(
                    height: 60,
                    child: Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: myResponsiveText(
                            maxLines: 2,
                            text: "COMPLETED \n APPOINTMENTS",
                            align: TextAlign.center,
                            textColor: Color(0xff4B4B4B),
                            initialFontSize: 5,
                            weight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Stack(
            children: [
              myContainer(
                context: context,
                child: Opacity(
                    opacity: 0.4,
                    child: Image.asset(
                      'assets/home_screen_bg.png',
                      fit: BoxFit.cover,
                    )),
                height: 1,
                width: 1,
              ),
              TabBarView(
                children: [
                  PendingAppointmentWidget(appointmentScreenViewModel: viewModel),
                  AttendedAppointmentWidget(appointmentScreenViewModel: viewModel),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

