import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Helper extends GetxController {
/* --======= Validations ========-- */
 // static String? validateEmail(Value) {}

// static String? validatePassword(Value) {}

/* -- ======= Snack-Bars ======== -- */

  static successSnackBar({required title, message}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 6),
      margin: EdgeInsets.all(20),
      icon: Icon(Icons.check_circle, color: Colors.white,)
    );
  }

  static warningSnackBar({required title, message}){
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.black,
      backgroundColor: Colors.amberAccent,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 6),
      margin: EdgeInsets.all(20),
      icon: Icon(Icons.check_circle, color: Colors.white,)
    );
  }

  static errorSnackBar({required title, message}){
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.red,
      backgroundColor:  Colors.redAccent.withOpacity(0.1),
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 6),
      margin: EdgeInsets.all(20),
      icon: Icon(Icons.check_circle, color: Colors.white,)
    );
  }

  static modernSnackBar({required title, message}){
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.black,
      backgroundColor: Colors.blueAccent,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 6),
      margin: EdgeInsets.all(20),
      icon: Icon(Icons.check_circle, color: Colors.white,)
    );
  }
}
