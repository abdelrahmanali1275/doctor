import 'package:bloc/bloc.dart';
import 'package:esteshary_doctor/core/data/firebase/firebase_requests.dart';
import 'package:meta/meta.dart';

import '../../../../core/data/models/request_model.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit() : super(HistoryInitial());

  FireBaseRequests fireBaseRequests = FireBaseRequests();

  historyDoctor() async {
    emit(HistoryLoading());
    var res = await fireBaseRequests.historyRequests();

    res.fold((l) => emit(HistoryErr(message: l.message)),
        (r) => emit(HistoryLoaded(data: r)));
  }
}
