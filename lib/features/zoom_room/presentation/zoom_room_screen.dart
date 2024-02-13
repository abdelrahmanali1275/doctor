import 'package:esteshary_doctor/features/zoom_room/presentation/manager/zoom_cubit.dart';
import 'package:esteshary_doctor/features/zoom_room/presentation/widgets/zoom_room_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/widgets/custom_app_bar.dart';

class ZoomRoomScreen extends StatelessWidget {
  const ZoomRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: "غرف الكشف",
      ),
      body: BlocProvider(
        create: (context) => ZoomCubit()..dayRoom(),
        child: ZoomRoomScreenBody(),
      ),
    );
  }
}
