import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';

class YourTimeAvailable extends StatelessWidget {
  const YourTimeAvailable({
    super.key,
    required this.timeFrom,
    required this.timeTo,
    required this.function,
  });

  final String timeFrom;
  final String timeTo;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.from,
                style: CustomTextStyles.bodyLargeBlack900,
              ),
              Container(
                height: 50.h,
                width: 140.w,
                decoration: AppDecoration.fillOnPrimaryContainer,
                child: Center(
                    child: Text(
                  timeFrom,
                  style: CustomTextStyles.bodyLargeBlack900Bold25,
                )),
              ),
            ],
          ),
          10.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.to,
                style: CustomTextStyles.bodyLargeBlack900,
              ),
              Container(
                height: 50.h,
                width: 140.w,
                decoration: AppDecoration.fillOnPrimaryContainer,
                child: Center(
                    child: Text(
                  timeTo,
                  style: CustomTextStyles.bodyLargeBlack900Bold25,
                )),
              ),
            ],
          ),
          10.width,
          IconButton(
              onPressed: function,
              icon: Icon(
                Icons.remove_circle_outline_sharp,
                color: AppColors.redA700,
              ))
        ],
      ),
    );
  }
}
