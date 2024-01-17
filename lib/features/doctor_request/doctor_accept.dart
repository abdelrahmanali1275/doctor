import 'package:flutter/material.dart';
import 'package:esteshary_doctor/core/utils/app_strings.dart';
import 'package:esteshary_doctor/features/doctor_request/presentation/widgets/doctor_accept_history.dart';
import '../../core/widgets/custom_app_bar.dart';

class DoctorAcceptedScreen extends StatelessWidget {
  const DoctorAcceptedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        text: AppStrings.accept,
      ),
      body: DoctorAcceptedBody(),
    );
  }
}
