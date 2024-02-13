import 'package:esteshary_doctor/core/widgets/custom_app_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:esteshary_doctor/core/utils/extension/int.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../config/theme/custom_text_style.dart';
import '../../../../core/data/models/request_model.dart';

class AcceptRequestCard extends StatelessWidget {
  const AcceptRequestCard({
    super.key,
    required this.index,
    required this.data,
  });

  final List<RequestModel> data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: AppColors.primary.withOpacity(.9),
      color: AppColors.lightBlue50,
      margin: const EdgeInsets.only(bottom: 5, left: 10, right: 10, top: 10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("حجز رقم",
                    style: CustomTextStyles.bodyLargeBlack900Bold20),
                Spacer(),
                Chip(
                  label:
                      Text("${index + 1}", style: CustomTextStyles.fontSize20),
                  backgroundColor: AppColors.primary.withOpacity(.9),
                  padding: EdgeInsets.all(1),
                ),
              ],
            ),
            10.height,
            Row(
              children: [
                Text("حجز باسم  ",
                    style: CustomTextStyles.bodyMediumBlack20001),
                Text("${data[index].user.name}",
                    style: CustomTextStyles.bodyLargeBlack900Bold20),
                const Spacer(),
                ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${data[index].doctor.name}",
                          style: CustomTextStyles.bodyLargeWhiteA700),
                    )),
              ],
            ),
            10.height,
            Text(
                "يوم ${data[index].day} الساعة من ${data[index].from} الى ${data[index].to}",
                style: CustomTextStyles.bodyMediumBlack20001),
            10.height,
            Text(
                "حجز بتاريخ ${data[index].date}",
                style: CustomTextStyles.bodyMediumBlack20001),
            10.height,
            CustomAppBottom(
              label: "الدخول الى الغرفة",
              onPressed: () {},
            )
          ],
        ),
      ),
    ).animate().shimmer().animate().flip();
  }
}

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: [
//     data[index].notes != ''
//         ? Text("اضفت ملاحظاتك هنا",
//             style: CustomTextStyles.bodyMediumBlack20001)
//         : SizedBox(),
//     ElevatedButton(
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (context) =>
//                 NotesDialog(data: data, index: index),
//           );
//         },
//         child: Text(
//           AppStrings.addYourNotes,
//           style: CustomTextStyles.bodyLargeWhiteA700,
//         ).paddingAll(5)),
//   ],
// ),
