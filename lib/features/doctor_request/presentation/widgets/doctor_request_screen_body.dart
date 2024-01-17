import 'package:flutter/material.dart';
import 'package:esteshary_doctor/features/doctor_request/presentation/widgets/request_card.dart';


class DoctorRequestScreenBody extends StatelessWidget {
  const DoctorRequestScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => RequestCard(index: index+1,
      ),
      itemCount: 10,
    );
  }
}
