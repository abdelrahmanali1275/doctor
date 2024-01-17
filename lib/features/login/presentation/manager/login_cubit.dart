import 'dart:convert';
import 'package:esteshary_doctor/core/helper/error/failure.dart';
import 'package:esteshary_doctor/core/utils/extension/widget.dart';
import 'package:esteshary_doctor/features/home/presentation/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:esteshary_doctor/core/data/firebase/firebase_auth.dart';
import 'package:esteshary_doctor/core/data/firebase/doctor.dart';
import 'package:esteshary_doctor/core/helper/save_data.dart';

import '../../../../core/utils/app_strings.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  var key = GlobalKey<FormState>();
  bool lookPass = true;
  //
  AuthHelper authHelper = AuthHelper();
  FirebaseDoctor firebaseDoctor = FirebaseDoctor();

  lookPassChange() {
    lookPass == true ? lookPass = false : lookPass = true;
    emit(LookPassChangeState());
  }

  login(context) async {
    emit(LoginLoadingGetDataState());
    var res = await authHelper.login(email: email.text, pass: pass.text);
    res.fold((l) {
      emit(LoginErrState(l.message));
    }, (r) async {
      var resDoc = await firebaseDoctor.getDoctorData(r);
      resDoc.fold((l) {
        emit(LoginErrState(l.message));
      }, (r) {
        CacheHelper.saveData(
            key: AppStrings.cacheHelperKey, value: json.encode(r.toJson()));
        email.clear();
        pass.clear();
        HomeScreen().launch(context);
        emit(LoginSuccessState(
          AppStrings.loginSuccess,
        ));
      });
    });
  }
}
