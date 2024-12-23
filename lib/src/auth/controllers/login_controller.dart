import 'package:flutter/material.dart';
import 'package:flutter_application_test2/src/auth/controllers/snack_bar_controller.dart';
import 'package:flutter_application_test2/src/auth/firebase/authentication_repository/authentication_repository.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  static LoginController get instance => Get.find();

  //textfield controllers to get data from textformfield
  final showPassword = false.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  /// Loader
  final isLoading = false.obs;

  /// [EmailAndPasswordLogin]
  Future<void> login() async{
    try {
      isLoading.value = true;
      if(!loginFormKey.currentState!.validate()){
        isLoading.value = false;
        return;
      }
      final auth = AuthenticationRepository.instance;
      await auth.loginWithEmailandPassword(email.text.trim(), password.text.trim());
      auth.setIntialScreen(auth.firebaseUser);
    } catch (e) {
      isLoading.value = false;
      Helper.errorSnackBar(title: "On Snap", message: e.toString());
    }
  }
}