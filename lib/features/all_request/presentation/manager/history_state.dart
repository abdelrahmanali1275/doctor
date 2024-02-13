part of 'history_cubit.dart';

@immutable
abstract class HistoryState {}

class HistoryInitial extends HistoryState {}
class HistoryLoading extends HistoryState {}
class HistoryLoaded extends HistoryState {
  final List<RequestModel>data;

  HistoryLoaded({required this.data});
}
class HistoryErr extends HistoryState {
  final String message;

  HistoryErr({required this.message});
}