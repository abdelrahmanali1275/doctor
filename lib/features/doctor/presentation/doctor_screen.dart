import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:esteshary_doctor/core/widgets/custom_app_bar.dart';
import 'package:esteshary_doctor/features/doctor/presentation/manager/doctor_cubit.dart';

import '../../../core/utils/app_strings.dart';
import 'widgets/doctor_screen_body.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({super.key});

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
