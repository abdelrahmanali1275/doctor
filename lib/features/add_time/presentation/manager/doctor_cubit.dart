import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esteshary_doctor/core/app_export.dart';
import 'package:esteshary_doctor/core/helper/save_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/data/models/add_doctor_time_model.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit() : super(DoctorInitial());

  DoctorCubit get(context) => BlocProvider.of(context);

  var toController = TextEditingController();
  var fromController = TextEditingController();
  var key = GlobalKey<FormState>();
  int selectedIndex = 0;

  DateTime? addRequestDay;
  var day2;
  List<String> days = [
    AppStrings.saturDay,
    AppStrings.sunDay,
    AppStrings.monDay,
    AppStrings.tuesDay,
    AppStrings.wednesDay,
    AppStrings.thursDay,
    AppStrings.friDay,
  ];

  List daysOfRequest = [
    AppStrings.monDay,
    AppStrings.tuesDay,
    AppStrings.wednesDay,
    AppStrings.thursDay,
    AppStrings.friDay,
    AppStrings.saturDay,
    AppStrings.sunDay,
  ];

  doctorRemoveTime(num) async {
    await FirebaseFirestore.instance
        .collection("Doctors")
        .doc(CacheHelper.getDoctor().doctorId)
        .collection("Timer")
        .doc("$num")
        .delete();
    emit(DoctorRemoveTime());
  }

  dayName() {
    day2 = daysOfRequest[addRequestDay!.weekday - 1];
    emit(DayName());
  }

  void changeSelectedIndex(int index) {
    selectedIndex = index;
    emit(ChangeSelectedIndex());
  }

  addDoctorTimer() async {


    if (toController.text.isNotEmpty && fromController.text.isNotEmpty) {
      try {
        await FirebaseFirestore.instance
            .collection("Doctors")
            .doc(CacheHelper.getDoctor().doctorId)
            .collection("Timer")
            .doc("${DateFormat.yMMMMEEEEd("ar").format(addRequestDay!)}_${fromController.text}_${toController.text}")
            .set({
          "day": "${daysOfRequest[addRequestDay!.weekday - 1]}",
          "from": fromController.text,
          "date": addRequestDay!.format(),
          "to": toController.text,
          "active": true,
          "doctorId": CacheHelper.getDoctor().doctorId,
          "num": "${DateFormat.yMMMMEEEEd("ar").format(addRequestDay!)}_${fromController.text}_${toController.text}",
        });
        fromController.clear();
        toController.clear();
        emit(AddDoctorTimerSuccess("تم اضافة المعاد بنجاح"));
      } catch (e) {
        emit(AddDoctorTimerErr(e.toString()));
      }
    }
  }

  doctorTimesOfDay() async {
    List<AddDoctorTimeModel> data = [];
    emit(TimeLoading());
    try {
      var s = await FirebaseFirestore.instance
          .collection("Doctors")
          .doc(CacheHelper.getDoctor().doctorId)
          .collection("Timer")
          .where("day",
              isEqualTo: '${daysOfRequest[addRequestDay!.weekday - 1]}')
          .where("date", isEqualTo: addRequestDay!.format())
          .get();
      s.docs.forEach((element) {
        data.add(AddDoctorTimeModel.fromJson(element.data()));
      });
      emit(TimeLoaded(data));
    } catch (e) {
      emit(TimeErr(e.toString()));
    }
  }

  TimeOfDay addMinutesToTime(TimeOfDay time, int minutesToAdd) {
    int totalMinutes = time.hour * 60 + time.minute + minutesToAdd;
    return TimeOfDay(hour: totalMinutes ~/ 60, minute: totalMinutes % 60);
  }
}
