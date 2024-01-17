import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:esteshary_doctor/core/utils/app_strings.dart';
import 'package:esteshary_doctor/core/utils/extension/int.dart';
import 'package:esteshary_doctor/core/utils/extension/widget.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../config/theme/custom_text_style.dart';

class ZoomRoomCard extends StatelessWidget {
  const ZoomRoomCard({
    super.key, required this.index,
  });

  final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: AppColors.primary.withOpacity(.9),
      color: AppColors.lightBlue50,
      margin: const EdgeInsets.only(bottom: 5,left: 10,right: 10,top: 10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("الحجز رقم   ", style: CustomTextStyles.bodyLargeBlack900Bold20),
                const Spacer(),
                Chip(
                  label: Text("$index", style: CustomTextStyles.fontSize20),
                  backgroundColor: AppColors.primary.withOpacity(1),
                  padding: EdgeInsets.all(1),
                ),
              ],
            ),
            10.height,
            Text("محمد احمد علي",style: CustomTextStyles.bodyLargeBlack900Bold20),
            10.height,
            Text("يوم الثلاثاء الساعة من 2:00 الى 2:30",style: CustomTextStyles.bodyMediumBlack20001),
            10.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                 Chip(
                  backgroundColor: AppColors.primary.withOpacity(.9),
                  label:const Text(AppStrings.goToRoom),).onTap((){
                }),
              ],
            ),
          ],
        ),
      ),
    ).animate().shimmer().animate().flip();
  }
}