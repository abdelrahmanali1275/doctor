import 'package:flutter/material.dart';
import 'package:esteshary_doctor/config/theme/custom_text_style.dart';
import 'package:esteshary_doctor/core/app_export.dart';
import 'package:esteshary_doctor/core/utils/app_strings.dart';
import 'package:esteshary_doctor/core/utils/extension/widget.dart';
import 'package:esteshary_doctor/core/widgets/custom_app_bottom.dart';

import '../../../../core/widgets/custom_text_form_field.dart';

class AddNotesScreenBody extends StatelessWidget {
  const AddNotesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: [
          Text(AppStrings.addYourNotesFrom,style: CustomTextStyles.bodyLargeBlack900Bold20,),
          15.height,
          CustomTextFormField(
            hintText: 'اخبر المريض عن الاشاعات والتحاليل المطلوبة منه قبل البدأ',
            maxLines: 10,
            maxLength: 300,
          ),
          15.height,
          CustomAppBottom(label: AppStrings.save,onPressed: (){}),
        ],
      ).paddingAll(15),
    );
  }
}
