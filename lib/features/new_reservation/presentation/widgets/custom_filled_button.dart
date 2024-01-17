import 'package:flutter/material.dart';
import 'package:esteshary_doctor/config/theme/custom_text_style.dart';
import 'package:esteshary_doctor/core/utils/app_colors.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    super.key,
    required this.timeTextButton,
  });

  final String timeTextButton;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: AppColors.whiteA700,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("لتاكيد حجز المعاد",style: CustomTextStyles.bodyLargeBlack900,),
                Text("$timeTextButton",style: CustomTextStyles.bodyMediumPrimary),
              ],
            ),
            content: Text("اضغط على زر متابعة",style: CustomTextStyles.bodyLargeBlack900),
            actions: [
              TextButton(
                  onPressed: () {
                    // PaymentScreen().launch(context);
                  },
                  child: Text("متابعة",style: CustomTextStyles.bodyMediumPrimary)),
            ],
          ),
        );
      },
      child: Text(timeTextButton),
    );
  }
}
