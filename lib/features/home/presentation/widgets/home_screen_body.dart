import 'package:flutter/material.dart';
import 'package:esteshary_doctor/core/app_export.dart';
import 'package:esteshary_doctor/core/utils/app_strings.dart';
import 'package:esteshary_doctor/core/utils/extension/widget.dart';
import 'package:esteshary_doctor/features/doctor/presentation/doctor_screen.dart';
import 'package:esteshary_doctor/features/doctor_request/doctor_accept.dart';
import '../../../all_request/all_request_screen.dart';
import '../../../zoom_room/presentation/zoom_room_screen.dart';
import 'home_screen_circle_widget.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HomeScreenWidget(
            image: AppAssets.hagz,
            text: AppStrings.confirmed,
            function: () {
              DoctorAcceptedScreen().launch(context);
              },
          ),
          HomeScreenWidget(
            image: AppAssets.chat,
            text: AppStrings.all,
            function: () {
              AllRequestsScreen().launch(context);
            },
          ),
          HomeScreenWidget(
            image: AppAssets.chat,
            text: AppStrings.room,
            function: () {
              ZoomRoomScreen().launch(context);
            },
          ),
          HomeScreenWidget(
            image: AppAssets.newHagz,
            text: AppStrings.addYourTime,
            function: () {
              DoctorScreen().launch(context);
            },
          ),
        ],
      ).paddingAll(10),
    );
  }
}
