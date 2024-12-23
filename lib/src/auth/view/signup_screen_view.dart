import 'package:flutter/material.dart';
import 'package:flutter_application_test2/animation/fade_animation.dart';
import 'package:flutter_application_test2/src/auth/controllers/signup_controller.dart';
import 'package:flutter_application_test2/src/auth/view/login_screen_view.dart';
import 'package:get/get.dart';

class SignupScreenView extends StatelessWidget {
  static final _formKey = GlobalKey<FormState>();
  const SignupScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SingUpController());
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
                      "SignUp",
                      style: TextStyle(
                          color: Color.fromRGBO(49, 39, 79, 1),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
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
                      child: Form(
                        key: _formKey,
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
                                  controller: controller.fullName,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "FullName",
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
                                  controller:controller.email,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Email",
                                      hintStyle:
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
                                  controller: controller.phoneNu,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Phone",
                                      hintStyle:
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
                                  controller: controller.password,
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
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  FaddeAnimation(
                    delay: 1.9,
                    child: MaterialButton(
                      onPressed: () {
                       if (_formKey.currentState!.validate()) {
                        // SingUpController.instance.registerUser(
                        //   controller.email.text.trim(),
                        //   controller.password.text.trim(),
                        // );

                        //phone sign up
                        // SingUpController.instance.phoneAuthentication(
                        //     controller.phoneNu.text.trim());

                        // pass the data of the user to controller
                        SingUpController.instance.createUser();
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeView()));
                      }
                      },
                      color: const Color.fromRGBO(49, 39, 79, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: const Center(
                        child: Text(
                          "SignUp",
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
                                  builder: (context) => LoginScreenView()));
                        },
                        child: const Text(
                          "LogIn",
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
