import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:esteshary_doctor/core/utils/app_strings.dart';
import 'package:esteshary_doctor/features/new_reservation/presentation/manager/new_reservation_cubit.dart';
import '../../core/widgets/custom_app_bar.dart';
import 'presentation/widgets/new_reservation_body.dart';

class NewReservationScreen extends StatelessWidget {
  const NewReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewReservationCubit(),
      child: const Scaffold(
        appBar: CustomAppBar(
          text: AppStrings.timeAvailable,
        ),
        body: NewReservationBody(),
      ),
    );
  }
}
