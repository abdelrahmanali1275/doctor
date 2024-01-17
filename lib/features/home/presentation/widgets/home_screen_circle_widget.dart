import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:esteshary_doctor/core/app_export.dart';
import 'package:esteshary_doctor/core/utils/app_colors.dart';


class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({
    super.key,
    required this.text,
    required this.image,
    required this.function,
  });

  final String text;
  final String image;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Card(
        margin: EdgeInsets.all(5),
        color: AppColors.primary.withOpacity(1),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(image),
                radius: 50,
              ),
              15.width,
              Text(
                text,
                style: CustomTextStyles.titleMediumWhiteA700Bold18,
           ),
            ],
          ),
        ),
      ),
    ).animate().shimmer().animate().flipV();
  }
}