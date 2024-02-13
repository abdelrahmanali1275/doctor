import 'package:flutter/material.dart';
import 'package:esteshary_doctor/core/app_export.dart';

import '../../../../core/widgets/custom_checkbox_button.dart';
import '../manager/doctor_cubit.dart';

class DayCheckBoxListView extends StatelessWidget {
  const DayCheckBoxListView({
    super.key,
    required this.cubit,
  });

  final DoctorCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(7.0),
          child: CustomCheckboxButton(
            onChange: (h) {
              cubit.changeSelectedIndex(index);
            },
            text: cubit.days[index],
            iconSize: 20,
            value: cubit.selectedIndex == index,
          ),
        ),
        itemCount: cubit.days.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
