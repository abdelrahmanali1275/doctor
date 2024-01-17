import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import '../../helper/error/failure.dart';
import '../doctor_model.dart';

class FirebaseDoctor {
  Future<Either<ErrorFailure, DoctorModel>> getDoctorData(doctorId) async {
    try {
      var res = await FirebaseFirestore.instance
          .collection("Doctors")
          .doc(doctorId)
          .get();

      // List<DoctorModel> users=[];
      //
      //
      // res.docs.forEach((element) {
      //   users.add(DoctorModel.fromJson(element.data()));
      // });

      if (res.data() == null) {
        return Left(ErrorFailure(message: "لا يوجد بيانات متاحة"));
      } else {
        print(res.data()!);
        return Right(DoctorModel.fromJson(res.data()!));
      }
    } catch (e) {
      return Left(ErrorFailure(message: e.toString()));
    }
  }

  Future<Either<ErrorFailure, String>> setDoctorData(
    DoctorModel doctorModel,
  ) async {
    try {
      final res = await FirebaseFirestore.instance
          .collection("Doctors")
          .doc(doctorModel.doctorId)
          .set(doctorModel.toJson());

// add message
      return Right("تم اضافة البيانات بنجاح");
    } catch (e) {
      return Left(ErrorFailure(message: e.toString()));
    }
  }


}
