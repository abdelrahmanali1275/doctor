import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_strings.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit() : super(DoctorInitial());

  DoctorCubit get(context) => BlocProvider.of(context);

  var toController = TextEditingController();
  var fromController = TextEditingController();

  List timeAvailable = [
    "3:00 م",
    "4:00 م",
  ];
  List timeAvailable2 = [
    "4:00 م",
    "5:00 م",
  ];

  bool selectedIndex = false;
  int index1 = -1;
  List<String> days = [
    AppStrings.saturDay,
    AppStrings.sunDay,
    AppStrings.monDay,
    AppStrings.tuesDay,
    AppStrings.wednesDay,
    AppStrings.thursDay,
    AppStrings.friDay,
  ];

  doctorRemoveTime(index) {
    timeAvailable.removeAt(index);
    timeAvailable2.removeAt(index);
    emit(DoctorRemoveTime());
  }

  doctorAddTime() {
    if (toController.text.isNotEmpty && fromController.text.isNotEmpty) {
      timeAvailable.add(fromController.text);
      timeAvailable2.add(toController.text);
      toController.clear();
      fromController.clear();
    }

    emit(DoctorRemoveTime());
  }

  // changeSelectedIndex(index){
  //   if(selectedIndex==false){
  //     selectedIndex=true;
  //
  //     emit(ChangeSelectedIndex());
  //   }else{
  //     selectedIndex= false;
  //
  //     emit(ChangeSelectedIndex());
  //   }
  // }

  int soundWaveIndex = -1;
  void changeSelectedIndex(int index) {
    if (soundWaveIndex != index) {
      soundWaveIndex = index;
      selectedIndex = true;
      emit(ChangeSelectedIndex());
    } else {
      soundWaveIndex = -1;
      selectedIndex = true;
      emit(ChangeSelectedIndex());
    }
  }
}
