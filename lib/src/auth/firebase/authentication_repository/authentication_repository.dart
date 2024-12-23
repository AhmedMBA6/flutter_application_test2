import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_test2/src/auth/firebase/authentication_repository/exception/exceptions.dart';
import 'package:flutter_application_test2/src/auth/view/login_screen_view.dart';
import 'package:flutter_application_test2/src/home/view/home_view.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> _firebaseUser;

  // Getters
  User? get firebaseUser => _firebaseUser.value;
  String get getUserID => firebaseUser?.uid ?? "";
  String get getUserEmail => firebaseUser?.email ?? "";

// loads when app launch from main
  @override
  void onReady() {
    // Future.delayed(Duration(seconds: 6));
    _firebaseUser = Rx<User?>(_auth.currentUser);
    _firebaseUser.bindStream(_auth.userChanges());
    setIntialScreen(_firebaseUser.value);
    //ever(firebaseUser, _setIntialScreen);
  }

  // setting intial screen
  setIntialScreen(User? user) {
    user == null
        ? Get.offAll(() => LoginScreenView())
        : Get.offAll(
                () => HomeView(),
              );
  }

  /* --------------------------Email & Password sign-in -------------------------*/

  /// [EmailAuthentication] - Login
  Future<void> loginWithEmailandPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (_) {}
  }

  /// [EmailAuthentication] - Register
  Future<void> createUserWithEmailandPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _firebaseUser.value != null
          ? Get.offAll(() => HomeView())
          : Get.to(() => LoginScreenView());
    } on FirebaseAuthException catch (e) {
      final ex = TeamExceptions.fromCode(e.code);
      print('Firebase Auth Exception - ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = TeamExceptions();
      print('Exception - ${ex.message}');
      throw ex;
    }
  }
}
