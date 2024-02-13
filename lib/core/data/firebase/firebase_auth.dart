import 'package:dartz/dartz.dart';
import 'package:esteshary_doctor/core/data/firebase/doctor.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../helper/error/failure.dart';

class AuthHelper {
  FirebaseDoctor firebaseDoctor = FirebaseDoctor();

  Future<Either<ErrorFailure, String>> login(
      {required String email, required String pass}) async {
    try {
      var res = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      return Right(res.user!.uid);
    } catch (e) {
      return Left(ErrorFailure(message: e.toString()));
    }
  }
}
