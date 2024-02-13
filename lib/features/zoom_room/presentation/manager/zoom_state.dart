part of 'zoom_cubit.dart';

@immutable
abstract class ZoomState {}

class ZoomInitial extends ZoomState {}
class ZoomLoading extends ZoomState {}
class ZoomLoaded extends ZoomState {
  final List<RequestModel>data;

  ZoomLoaded({required this.data});
}
class ZoomErr extends ZoomState {
  final String message;

  ZoomErr({required this.message});
}
