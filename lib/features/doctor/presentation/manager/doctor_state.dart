part of 'doctor_cubit.dart';

@immutable
abstract class DoctorState {}

class DoctorInitial extends DoctorState {}
class DoctorRemoveTime extends DoctorState {}
class DoctorAddTime extends DoctorState {}
class ChangeSelectedIndex extends DoctorState {}
