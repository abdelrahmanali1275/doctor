import 'package:flutter/material.dart';
import 'package:esteshary_doctor/core/utils/extension/widget.dart';
import 'package:esteshary_doctor/features/doctor_request/presentation/widgets/request_card.dart';


class DoctorAcceptedBody extends StatelessWidget {
  const DoctorAcceptedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => RequestCard(
        index: index+1,
      ).paddingSymmetric(horizontal: 10),
      itemCount: 10,
    );
  }
}
