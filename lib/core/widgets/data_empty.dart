import 'package:esteshary_doctor/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DataEmpty extends StatelessWidget {
  const DataEmpty({
    super.key,
    required this.txt,
  });

  final String txt;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          50.height,
          Lottie.asset('assets/lottie/no_result_lottie.json', width: 250.w),
          20.height,
          Text("$txt", style: CustomTextStyles.bodyLargeBlack900Bold20),
        ],
      ),
    );
  }
}
