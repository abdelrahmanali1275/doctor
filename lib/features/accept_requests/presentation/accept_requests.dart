import 'package:esteshary_doctor/features/accept_requests/presentation/widgets/accept_requests_body.dart';
import 'package:flutter/material.dart';
import 'package:esteshary_doctor/core/utils/app_strings.dart';
import '../../../core/widgets/custom_app_bar.dart';

class AcceptRequestsScreen extends StatelessWidget {
  const AcceptRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        text: AppStrings.accept,
      ),
      body: AcceptRequestsBody(),
    );
  }
}
