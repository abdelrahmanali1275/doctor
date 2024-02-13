import 'package:esteshary_doctor/config/theme/custom_text_style.dart';
import 'package:esteshary_doctor/core/widgets/data_empty.dart';
import 'package:esteshary_doctor/features/zoom_room/presentation/manager/zoom_cubit.dart';
import 'package:flutter/material.dart';
import 'package:esteshary_doctor/core/utils/extension/widget.dart';
import 'package:esteshary_doctor/features/zoom_room/presentation/widgets/zoom_room_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ZoomRoomScreenBody extends StatelessWidget {
  const ZoomRoomScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ZoomCubit, ZoomState>(
      builder: (context, state) {
        if (state is ZoomLoaded) {
          return state.data.isNotEmpty
              ? ListView.builder(
                  itemBuilder: (context, index) => ZoomRoomCard(
                    index: index ,
                    data: state.data,
                  ).paddingSymmetric(horizontal: 10),
                  itemCount: state.data.isEmpty ? 1 : state.data.length,
                )
              : DataEmpty(txt: "لا يوجد غرف كشف اليوم");
        }
        if (state is ZoomErr) {
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
