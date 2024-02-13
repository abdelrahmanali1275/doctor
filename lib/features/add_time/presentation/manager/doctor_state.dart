part of 'doctor_cubit.dart';

@immutable
abstract class DoctorState {}
class DoctorInitial extends DoctorState {}
class DoctorRemoveTime extends DoctorState {}
class DoctorAddTimeState extends DoctorState {}
class ChangeSelectedIndex extends DoctorState {}
class AddDoctorTimerLoading extends DoctorState {}
class AddDoctorTimerSuccess extends DoctorState {
  final String message;

  AddDoctorTimerSuccess(this.message);
}

class AddDoctorTimerErr extends DoctorState {
  final String message;

  AddDoctorTimerErr(this.message);
}

class TimeLoading extends DoctorState {}

class DayName extends DoctorState {}

class TimeLoaded extends DoctorState {
  final List<AddDoctorTimeModel> data;

  TimeLoaded(this.data);
}

class TimeErr extends DoctorState {
  final String message;
  TimeErr(this.message);
}
// final List<DoctorModel> timers;
