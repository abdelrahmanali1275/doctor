import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:esteshary_doctor/core/widgets/custom_app_bar.dart';

import '../../../core/utils/app_strings.dart';
import 'manager/doctor_cubit.dart';
import 'widgets/doctor_screen_body.dart';

class AddTimeScreen extends StatelessWidget {
  const AddTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        text: AppStrings.addYourTime,
      ),
      body: BlocProvider(
        create: (context) => DoctorCubit(),
        child: const DoctorScreenBody(),
      ),
    );
  }
}
