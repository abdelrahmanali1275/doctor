import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:esteshary_doctor/core/app_export.dart';
import '../../helper/error/failure.dart';
import '../../helper/save_data.dart';
import '../../utils/app_strings.dart';
import '../models/request_model.dart';

class FireBaseRequests {
  Future<Either<ErrorFailure, List<RequestModel>>> acceptRequests() async {
    try {
      String doctorId = CacheHelper.getDoctor().doctorId;
      var res = await FirebaseFirestore.instance
          .collection(AppStrings.requestsCollection)
          .where("state", isEqualTo: "تم التاكيد في انتظار الكشف")
          .where("doctor.doctorId", isEqualTo: doctorId)
          .get();
      return Right(res.docs
          .map<RequestModel>((e) => RequestModel.fromJson(e.data()))
          .toList());
    } catch (e) {
      return Left(ErrorFailure(message: e.toString()));
    }
  }

  Future<Either<ErrorFailure, List<RequestModel>>> historyRequests() async {
    try {
      String doctorId = CacheHelper.getDoctor().doctorId;
      var res = await FirebaseFirestore.instance
          .collection(AppStrings.requestsCollection)
          .where("state", isEqualTo: "تم الانتهاء")
          .where("doctor.doctorId", isEqualTo: doctorId)
          .get();
      return Right(res.docs
          .map<RequestModel>((e) => RequestModel.fromJson(e.data()))
          .toList());
    } catch (e) {
      return Left(ErrorFailure(message: e.toString()));
    }
  }

  Future<Either<ErrorFailure, List<RequestModel>>> dayRoom() async {
    try {
      String doctorId = CacheHelper.getDoctor().doctorId;
      var res = await FirebaseFirestore.instance
          .collection(AppStrings.requestsCollection)
          .where("state", isEqualTo: "تم التاكيد في انتظار الكشف")
          .where("date", isEqualTo: DateTime.now().format())
          .where("doctor.doctorId", isEqualTo: doctorId)
          .get();
      return Right(res.docs
          .map<RequestModel>((e) => RequestModel.fromJson(e.data()))
          .toList());
    } catch (e) {
      return Left(ErrorFailure(message: e.toString()));
    }
  }

  Future<Either<ErrorFailure, String>> addNotes(notes, idd) async {
    try {
      await FirebaseFirestore.instance
          .collection(AppStrings.requestsCollection)
          .doc("$idd")
          .update({
        "notes": notes,
      });
      return Right("تم اضافة الملاحظات بنجاح");
    } catch (e) {
      return Left(ErrorFailure(message: e.toString()));
    }
  }
}
