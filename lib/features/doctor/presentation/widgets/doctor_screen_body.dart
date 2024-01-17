import 'package:flutter/material.dart';
import 'package:esteshary_doctor/core/app_export.dart';
import 'package:esteshary_doctor/features/doctor/presentation/widgets/your_time_list_view.dart';
import '../../../../core/utils/app_strings.dart';
import 'add_your_time_available.dart';

class DoctorScreenBody extends StatelessWidget {
  const DoctorScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AddYourTimeAvailable(),
        10.height,
       const Divider(
          thickness: 10,
        ),
        10.height,
        Row(
          children: [
            20.width,
            Text(
              AppStrings.yourTime,
              style: CustomTextStyles.bodyLargeBlack900,
            ),
          ],
        ),
        5.height,
        const Divider(
          endIndent: 2,
          indent: 2,
        ),
        20.height,
       const YourTimeListView(),
      ],
    );
  }
}
