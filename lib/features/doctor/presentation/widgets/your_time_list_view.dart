import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:esteshary_doctor/core/app_export.dart';
import 'package:esteshary_doctor/core/utils/app_colors.dart';
import 'package:esteshary_doctor/core/utils/app_strings.dart';
import 'package:esteshary_doctor/features/doctor/presentation/manager/doctor_cubit.dart';
import 'package:esteshary_doctor/features/doctor/presentation/widgets/your_time_available.dart';

class YourTimeListView extends StatelessWidget {
  const YourTimeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorCubit, DoctorState>(builder: (context, state) {
      var cubit = DoctorCubit().get(context);

      if (state is TimeLoaded) {
        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => state.data.isEmpty
                ? Center(
                    child: Column(
                    children: [
                      Icon(
                        Icons.hourglass_empty,
                        size: 70,
                        color: AppColors.primary.withOpacity(.5),
                      ),
                      10.height,
                      Text(
                        AppStrings.pleaseAddYourTimeAvailable,
                        style: CustomTextStyles.bodyLargeBlack900,
                      ),
                    ],
                  ))
                : YourTimeAvailable(
                    timeFrom: state.data[index].from,
                    timeTo: state.data[index].to,
                    function: () {
                      cubit.doctorRemoveTime(
                          state.data[index].from, state.data[index].to);
                    },
                  ),
            itemCount: state.data.isEmpty ? 1 : state.data.length,
          ),
        );
      }
      if (state is TimeErr) {
        return Text(
          state.message,
          style: CustomTextStyles.bodyLargeBlack900Bold20,
        );
      }
      cubit.doctorTimesOfDay();
      return Center(child: CircularProgressIndicator());
    });
  }
}
