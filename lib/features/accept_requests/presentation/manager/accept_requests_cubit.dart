import 'package:bloc/bloc.dart';
import 'package:esteshary_doctor/core/data/firebase/firebase_requests.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/data/models/request_model.dart';

part 'accept_requests_state.dart';

class AcceptRequestsCubit extends Cubit<AcceptRequestsState> {
  AcceptRequestsCubit() : super(AcceptRequestsInitial());

  FireBaseRequests fireBaseRequests = FireBaseRequests();
  // TextEditingController controller = TextEditingController();
  //
  //
  //
  // addNotes(idd) async {
  //   emit(AddNotesLoading());
  //   var res = await fireBaseRequests.addNotes(controller.text, idd);
  //
  //   res.fold((l) => emit(AddNotesErr(message: l.message)),
  //       (r) => emit(AddNotesLoaded(message: r)));
  // }
  acceptRequests() async {
    emit(AcceptRequestsLoading());
    var res = await fireBaseRequests.acceptRequests();
    res.fold((l) => emit(AcceptRequestsErr(message: l.message)),
            (r) => emit(AcceptRequestsLoaded(data: r)));
  }
}
