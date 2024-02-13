part of 'accept_requests_cubit.dart';

@immutable
abstract class AcceptRequestsState {}

class AcceptRequestsInitial extends AcceptRequestsState {}
class AcceptRequestsLoading extends AcceptRequestsState {}
class AcceptRequestsLoaded extends AcceptRequestsState {
  final List<RequestModel> data;

  AcceptRequestsLoaded({required this.data});
}
class AcceptRequestsErr extends AcceptRequestsState {
  final String message;

  AcceptRequestsErr({required this.message});
}

class AddNotesLoading extends AcceptRequestsState {}
class AddNotesLoaded extends AcceptRequestsState {
  final String message;

  AddNotesLoaded({required this.message});
}
class AddNotesErr extends AcceptRequestsState {
  final String message;

  AddNotesErr({required this.message});
}
