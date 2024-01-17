import 'package:flutter/material.dart';
import 'package:esteshary_doctor/core/app_export.dart';
import 'package:esteshary_doctor/core/utils/app_strings.dart';
import 'package:esteshary_doctor/core/utils/extension/widget.dart';

import '../../../../config/theme/custom_text_style.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class DoctorAcceptAlertDialog extends StatelessWidget {
  const DoctorAcceptAlertDialog({super.key, });


  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      backgroundColor: AppColors.whiteA700,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppStrings.addYourNotes,style: CustomTextStyles.bodyLargeBlack900,).center(),
          10.height,
          CustomTextFormField(
            maxLines: 3,
            maxLength: 100,
          ),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
             Navigator.pop(context);
            },
            child: Text(AppStrings.send,style: CustomTextStyles.bodyMediumPrimary)),
      ],
    );
  }
}

