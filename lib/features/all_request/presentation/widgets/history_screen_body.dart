import 'package:esteshary_doctor/features/all_request/presentation/manager/history_cubit.dart';
import 'package:flutter/material.dart';
import 'package:esteshary_doctor/core/utils/extension/widget.dart';
import 'package:esteshary_doctor/features/all_request/presentation/widgets/history_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/theme/custom_text_style.dart';
import '../../../../core/widgets/data_empty.dart';

class HistoryScreenBody extends StatelessWidget {
  const HistoryScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryState>(
      builder: (context, state) {
        if (state is HistoryLoaded) {
          return state.data.isNotEmpty
              ? ListView.builder(
            itemBuilder: (context, index) => AllRequestCard(
              index: index ,
              data: state.data,
            ).paddingSymmetric(horizontal: 10),
            itemCount: state.data.isEmpty ? 1 : state.data.length,
          )
              : DataEmpty(txt: "لا توجد حجوزات");
        }
        if (state is HistoryErr) {
          return Text(
            state.message,
            style: CustomTextStyles.bodyLargeBlack900,
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
