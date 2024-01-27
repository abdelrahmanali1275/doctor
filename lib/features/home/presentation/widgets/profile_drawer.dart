import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esteshary_doctor/core/data/models/doctor_model.dart';
import 'package:esteshary_doctor/core/helper/save_data.dart';
import 'package:esteshary_doctor/core/utils/app_strings.dart';
import 'package:esteshary_doctor/core/utils/extension/widget.dart';
import 'package:esteshary_doctor/core/widgets/custom_app_bottom.dart';
import 'package:esteshary_doctor/features/login/presentation/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/app_export.dart';
import '../../../../core/utils/app_colors.dart';

class ProfileDrawer extends StatefulWidget {
  const ProfileDrawer({
    super.key,
  });

  @override
  State<ProfileDrawer> createState() => _ProfileDrawerState();
}

class _ProfileDrawerState extends State<ProfileDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.whiteA700,
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: AppColors.primary,
            child: CircleAvatar(
              radius: 45,
              backgroundImage: NetworkImage(CacheHelper.getDoctor().photo),
            ),
          ).paddingOnly(top: 60),
          ListTile(
            trailing: Text(
              CacheHelper.getDoctor().name,
              style: CustomTextStyles.fontSize18,
            ),
            leading: Text(
              "الاسم",
              style: CustomTextStyles.bodyLargeBlack900Bold20,
            ),
          ),
          Divider(
            thickness: 2,
            indent: 15,
            endIndent: 15,
          ),
          ListTile(
            trailing: Text(
              CacheHelper.getDoctor().specialist,
              style: CustomTextStyles.fontSize18,
            ),
            leading: Text(
              "التخصص",
              style: CustomTextStyles.bodyLargeBlack900Bold20,
            ),
          ),
          Divider(
            thickness: 2,
            indent: 15,
            endIndent: 15,
          ),
          ListTile(
            trailing: Text(
              CacheHelper.getDoctor().email,
              style: CustomTextStyles.fontSize18,
            ),
            leading: Text(
              AppStrings.email,
              style: CustomTextStyles.bodyLargeBlack900Bold20,
            ),
          ),
          10.height,
          CustomAppBottom(
            label: "تسجيل الخروج",
            onPressed: () {
              Login().launch(context, isNewTask: true);
              CacheHelper.removeData(key: "doctor");
            },
          ).paddingSymmetric(horizontal: 30).animate().flip()
        ],
      ),
    );
  }
}
