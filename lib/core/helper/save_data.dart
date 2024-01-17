import 'dart:convert';

import 'package:esteshary_doctor/core/data/doctor_model.dart';
import 'package:esteshary_doctor/core/data/doctor_model.dart';
import 'package:esteshary_doctor/core/data/doctor_model.dart';
import 'package:esteshary_doctor/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;
  static initShared() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putBool(
      {required String key, required bool value}) async {
    return await sharedPreferences.setBool(key, value);
  }

  static dynamic getData({required String? key}) {
    return sharedPreferences.get(key!);
  }

  static Future<bool?> saveData(
      {required String key, required dynamic value}) async {
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);
    if (value is double) return await sharedPreferences.setDouble(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
    return null;
  }

  static Future<bool?> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  static bool isLogin() {
    return CacheHelper.getData(key:AppStrings.cacheHelperKey) == null;
  }

  static DoctorModel getDoctor() {
    var s = CacheHelper.getData(key:AppStrings.cacheHelperKey);
    DoctorModel doctor = DoctorModel.fromJson(json.decode(s));
    return doctor;
  }

  logOut() {
    removeData(key:AppStrings.cacheHelperKey);
  }

}