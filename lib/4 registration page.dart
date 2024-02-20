import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '3 login database.dart';
import '3 login model.dart';

class projreg extends StatefulWidget {
  @override
  State<projreg> createState() => _projregState();
}

class _projregState extends State<projreg> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmpass = TextEditingController();

  var formkey1 = GlobalKey<FormState>();
  bool hidepass = true;
  bool hidepass1 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        image: NetworkImage(
            "https://img.freepik.com/free-photo/collection-vivid-plants-with-copy-space_23-2148535931.jpg?size=626&ext=jpg&ga=GA1.1.287262219.1700045936&semt=ais"),
      )),
      child: SingleChildScrollView(
          child: Form(
              key: formkey1,
              child: Column(
                children: [
                  Center(
                      child: Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text(
                      "Register here",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  )),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: email,
                      obscureText: hidepass,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                          prefixIcon:
                              const Icon(Icons.drive_file_rename_outline),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                if (hidepass) {
                                  hidepass = false;
                                } else {
                                  hidepass = true;
                                }
                              });
                            },
                            icon: Icon(hidepass == true
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          labelText: "Email",
                          hintText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextFormField(
                        controller: password,
                        obscureText: hidepass1,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                          prefixIcon:
                              const Icon(Icons.drive_file_rename_outline),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                if (hidepass1) {
                                  hidepass1 = false;
                                } else
                                  hidepass1 = true;
                              });
                            },
                            icon: Icon(hidepass1 == true
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          labelText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        textInputAction: TextInputAction.next,
                      )),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: TextFormField(
                      controller: confirmpass,
                      // obscureText: hidepass2,
                      //obscuringCharacter: '*',
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: "Confirm Password",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60, right: 60),
                    child: ElevatedButton(
                        onPressed: () {
                          ValidateSignUp();
                        },
                        child: Text("Sign In")),
                  ),
                ],
              ))),
    ));
  }

  void ValidateSignUp() async {
    final Email = email.text.trim(); // email from controller
    final Pass = password.text.trim(); // password from controller
    final Cpass = confirmpass.text.trim(); //confirm password from controller

    final emailValidationResult = EmailValidator.validate(Email);

    if (Email != "" && Pass != "" && Cpass != "") {
      if (emailValidationResult == true) {
        final passValidationResult = checkPassword(Pass, Cpass);
        if (passValidationResult == true) {
          final user = User(email: Email, password: Pass);
          await DBFunction.instance.userSignUp(user);
          Get.back();
          Get.snackbar("Success", "Account created");
        }
      } else {
        Get.snackbar("Error", "Provide a valid email");
      }
    } else {
      Get.snackbar("Error", "Fields can not be empty");
    }
  }

  bool checkPassword(String pass, String cpass) {
    if (pass == cpass) {
      if (pass.length < 6) {
        Get.snackbar("Error", "Password length should be >6");
        return false;
      } else {
        return true;
      }
    } else {
      Get.snackbar("Error", "Password mismatch");
      return false;
    }
  }
}
