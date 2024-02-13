import 'package:esteshary_doctor/features/accept_requests/presentation/manager/accept_requests_cubit.dart';
import 'package:flutter/material.dart';
import 'package:esteshary_doctor/core/app_export.dart';
import 'package:esteshary_doctor/core/utils/app_strings.dart';
import 'package:esteshary_doctor/core/utils/extension/widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/models/request_model.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class NotesDialog extends StatelessWidget {
  const NotesDialog({
    super.key,
    required this.data,
    required this.index,
  });

  final List<RequestModel> data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AcceptRequestsCubit, AcceptRequestsState>(
      builder: (context, state) {
        return AlertDialog(
          backgroundColor: AppColors.whiteA700,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.addYourNotes,
                style: CustomTextStyles.bodyLargeBlack900,
              ).center(),
              10.height,
              CustomTextFormField(
                maxLines: 3,
                // controller: context.read<AcceptRequestsCubit>().controller,
              ),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () async {
                  // await context
                  //     .read<AcceptRequestsCubit>()
                  //     .addNotes(
                  //     data[index].id);
                  // Navigator.pop(context);
                },
                child: Text(AppStrings.send,
                    style: CustomTextStyles.bodyMediumPrimary)),
          ],
        );
      },
    );
  }
}
