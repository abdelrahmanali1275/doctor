import 'package:esteshary_doctor/core/app_export.dart';
import 'package:esteshary_doctor/core/utils/extension/widget.dart';
import 'package:esteshary_doctor/features/accept_requests/presentation/widgets/accept_requests_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/theme/custom_text_style.dart';
import '../../../../core/widgets/data_empty.dart';
import '../manager/accept_requests_cubit.dart';

class AcceptRequestsBody extends StatelessWidget {
  const AcceptRequestsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AcceptRequestsCubit, AcceptRequestsState>(
      builder: (context, state) {
        if (state is AcceptRequestsLoaded) {
          return ListView.builder(
            itemBuilder: (context, index) => state.data.isNotEmpty
                ? AcceptRequestCard(
                    index: index,
                    data: state.data,
                  ).paddingSymmetric(horizontal: 10)
                : DataEmpty(txt: 'مؤكدة'),
            itemCount: state.data.isEmpty ? 1 : state.data.length,
          );
        }
        if (state is AcceptRequestsErr) {
          return Container(
            child: Text(
              state.message,
              style: CustomTextStyles.bodyLargeBlack900Bold20,
            ),
          );
        } else {
          context.read<AcceptRequestsCubit>().acceptRequests();
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
