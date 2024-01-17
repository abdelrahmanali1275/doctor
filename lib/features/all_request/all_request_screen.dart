import 'package:flutter/material.dart';
import 'package:esteshary_doctor/features/all_request/presentation/widgets/all_request_screen_body.dart';
import '../../core/widgets/custom_app_bar.dart';

class AllRequestsScreen extends StatelessWidget {
  const AllRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        text: "كل الحجوزات",
      ),
      body: AllRequestsScreenBody(),
    );
  }
}
