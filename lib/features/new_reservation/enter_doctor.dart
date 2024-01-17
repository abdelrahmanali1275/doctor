import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:esteshary_doctor/core/app_export.dart';
import 'package:esteshary_doctor/core/utils/app_strings.dart';
import 'package:esteshary_doctor/core/widgets/custom_app_bar.dart';
import 'package:esteshary_doctor/features/home/presentation/manager/home_cubit.dart';

import '../../core/utils/app_colors.dart';
import '../home/presentation/widgets/specialization_list.dart';

class EnterDoctor extends StatelessWidget {
  const EnterDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        text: AppStrings.specialestAvailable,
      ),
      body: BlocProvider(
        create: (context) => HomeCubit(),
        child: Column(
          children: [
            Text(
              AppStrings.specialestAvailable,
              style: TextStyle(
                  color: AppColors.blueGray700,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            ),
            30.height,
            SpecializationList(),
          ],
        ),
      ),
    );
  }
}
