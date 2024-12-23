import 'package:flutter/material.dart';
import 'package:flutter_application_test2/animation/fade_animation.dart';
import 'package:flutter_application_test2/src/auth/controllers/login_controller.dart';
import 'package:flutter_application_test2/src/auth/view/signup_screen_view.dart';
import 'package:flutter_application_test2/src/home/view/home_view.dart';
import 'package:get/get.dart';

class LoginScreenView extends StatefulWidget {
  const LoginScreenView({super.key});

  @override
  State<LoginScreenView> createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {

  @override
  Widget build(BuildContext context) {
     final controller = Get.put(LoginController());
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FaddeAnimation(
              delay: 1.3,
              child: SizedBox(
                height: 380,
                child: Stack(
                  children: [
                    Positioned(
                      top: -40,
                      height: 350,
                      width: width,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/background.png"),
                                fit: BoxFit.fill)),
                      ),
                    ),
                    Positioned(
                        height: 350,
                        width: width + 20,
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/background-2.png"),
                                fit: BoxFit.fill),
                          ),
                        )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const FaddeAnimation(
                    delay: 1.5,
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Color.fromRGBO(49, 39, 79, 1),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Form(
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(
                                color: Color.fromRGBO(196, 135, 198, .3)),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(196, 135, 198, .3),
                                blurRadius: 20,
                                offset: Offset(0, 10),
                              )
                            ]),
                        child: Column(
                          children: <Widget>[
                            FaddeAnimation(
                              delay: 1.6,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Color.fromRGBO(
                                                196, 135, 198, .3)))),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "UserName",
                                      helperStyle:
                                          TextStyle(color: Colors.grey.shade700)),
                                ),
                              ),
                            ),
                            FaddeAnimation(
                              delay: 1.7,
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Color.fromRGBO(
                                                196, 135, 198, .3)))),
                                child: TextFormField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Password",
                                      hintStyle:
                                          TextStyle(color: Colors.grey.shade700)),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: FaddeAnimation(
                    delay: 1.8,
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot Password",
                          style: TextStyle(
                              color: Color.fromRGBO(196, 135, 198, 1)),
                        )),
                  )),
                  const SizedBox(
                    height: 30,
                  ),
                  FaddeAnimation(
                    delay: 1.9,
                    child: MaterialButton(
                      onPressed: () {
                        controller.login();
                      },
                      color: const Color.fromRGBO(49, 39, 79, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: FaddeAnimation(
                    delay: 2,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupScreenView()));
                        },
                        child: const Text(
                          "Create Account",
                          style:
                              TextStyle(color: Color.fromRGBO(49, 39, 79, 6)),
                        )),
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
