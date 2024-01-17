import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:esteshary_doctor/config/theme/custom_text_style.dart';
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
      return Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) => cubit.timeAvailable.isEmpty
              ? Center(child: Column(
                children: [
                  Icon(Icons.hourglass_empty,size: 70,color: AppColors.primary.withOpacity(.5),),
                  10.height,
                  Text(AppStrings.pleaseAddYourTimeAvailable,style: CustomTextStyles.bodyLargeBlack900,),
                ],
              ))
              : YourTimeAvailable(
                  timeFrom: cubit.timeAvailable[index],
                  timeTo: cubit.timeAvailable2[index],
                  function: () {
                    cubit.doctorRemoveTime(index);
                  },
                ),
          itemCount:
              cubit.timeAvailable.isEmpty ? 1 : cubit.timeAvailable.length,
        ),
      );
    });
  }
}
