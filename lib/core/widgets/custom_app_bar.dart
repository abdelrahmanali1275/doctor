import 'package:esteshary_doctor/core/utils/extension/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:esteshary_doctor/core/app_export.dart';
import 'package:esteshary_doctor/core/utils/app_colors.dart';

import '../../features/login/presentation/pages/login_screen.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({
    super.key, this.height=60, this.text='', this.backgroundColor, this.widget,
  });
  final double? height;
  final String? text;
  final Color? backgroundColor;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: backgroundColor??AppColors.primary.withOpacity(1),
      title: Text(text!,),

      toolbarHeight: height ?? 50.h,

      actions: [

        widget!= null? Row(
          children: [
            Text("تسجيل الخروج",style: CustomTextStyles.fontSize18,),
            Directionality(textDirection: TextDirection.ltr,
                child: Icon(Icons.backspace_outlined,)),
          ],
        ).onTap((){
          Login().launch(context,isNewTask: true);
        }):SizedBox(),
      ],
    );
  }

  @override
  Size get preferredSize => Size(
    mediaQueryData.size.width,
    height ?? 32.h,
  );
}
