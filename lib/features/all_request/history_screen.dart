import 'package:esteshary_doctor/features/all_request/presentation/manager/history_cubit.dart';
import 'package:flutter/material.dart';
import 'package:esteshary_doctor/features/all_request/presentation/widgets/history_screen_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/widgets/custom_app_bar.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: "الحجوزات السابقة",
      ),
      body: BlocProvider(
        create: (context) => HistoryCubit()..historyDoctor(),
        child: HistoryScreenBody(),
      ),
    );
  }
}
