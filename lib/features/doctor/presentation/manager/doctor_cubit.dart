import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esteshary_doctor/core/helper/save_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/data/models/add_doctor_time_model.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit() : super(DoctorInitial());

  DoctorCubit get(context) => BlocProvider.of(context);

  var toController = TextEditingController();
  var fromController = TextEditingController();
  var key= GlobalKey<FormState>();
  int selectedIndex = 0;



  List<String> days = [
    AppStrings.saturDay,
    AppStrings.sunDay,
    AppStrings.monDay,
    AppStrings.tuesDay,
    AppStrings.wednesDay,
    AppStrings.thursDay,
    AppStrings.friDay,
  ];

  doctorRemoveTime(from,to) async{
    await FirebaseFirestore.instance
        .collection("Doctors")
        .doc(CacheHelper.getDoctor().doctorId)
        .collection("Timer").doc("${selectedIndex}_${from}_${to}").delete();
    emit(DoctorRemoveTime());
  }




  void changeSelectedIndex(int index) {
    selectedIndex = index;
    emit(ChangeSelectedIndex());
  }

  addDoctorTimer() async {
    emit(AddDoctorTimerLoading());

    // s.docs.forEach((element) {
    //   print(element.data());
    // });

    // print(CacheHelper.getDoctor().doctorId);
    if (toController.text.isNotEmpty && fromController.text.isNotEmpty) {
      try {
        await FirebaseFirestore.instance
            .collection("Doctors")
            .doc(CacheHelper.getDoctor().doctorId)
            .collection("Timer")
            .doc(
                "${selectedIndex}_${fromController.text}_${toController.text}")
            .set({
          "day": "$selectedIndex",
          "from": fromController.text,
          "to": toController.text,
          "active": true,
          "doctorId": CacheHelper.getDoctor().doctorId
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
          .where("day", isEqualTo: '${selectedIndex}')
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
