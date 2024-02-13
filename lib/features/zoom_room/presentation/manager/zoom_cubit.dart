import 'package:bloc/bloc.dart';
import 'package:esteshary_doctor/core/data/firebase/firebase_requests.dart';
import 'package:meta/meta.dart';

import '../../../../core/data/models/request_model.dart';

part 'zoom_state.dart';

class ZoomCubit extends Cubit<ZoomState> {
  ZoomCubit() : super(ZoomInitial());

  FireBaseRequests fireBaseRequests = FireBaseRequests();

  dayRoom() async {
    emit(ZoomLoading());
    var res = await fireBaseRequests.dayRoom();

    res.fold((l) => emit(ZoomErr(message: l.message)),
        (r) => emit(ZoomLoaded(data: r)));
  }
}
