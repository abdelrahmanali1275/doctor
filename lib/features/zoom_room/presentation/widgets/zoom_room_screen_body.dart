import 'package:flutter/material.dart';
import 'package:esteshary_doctor/core/utils/extension/widget.dart';
import 'package:esteshary_doctor/features/zoom_room/presentation/widgets/zoom_room_card.dart';

class ZoomRoomScreenBody extends StatelessWidget {
  const ZoomRoomScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ZoomRoomCard(index: index+1,
      ).paddingSymmetric(horizontal: 10),
      itemCount: 10,
    );
  }
}
