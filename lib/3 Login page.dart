import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive_flutter/adapters.dart';
import '3 login database.dart';
import '3 login model.dart';
import '4 registration page.dart';
import '5 Homepage.dart';

//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Hive.initFlutter();
//   Hive.registerAdapter(UserAdapter() as TypeAdapter);
//   Hive.openBox<User>('user');
//   runApp(GetMaterialApp(
//     home: projlogin(),
//   ));
// }

class projlogin extends StatefulWidget {
  @override
  State<projlogin> createState() => _projloginState();
}

class _projloginState extends State<projlogin> {
  TextEditingController uname = TextEditingController();
  TextEditingController pass = TextEditingController();
  var formkey = GlobalKey<FormState>();

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
      child: ListView(children: [
        const Center(
            child: Padding(
          padding: EdgeInsets.only(top: 60.0),
          child: Text(
            "Login Here",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        )),
        Padding(
          padding: const EdgeInsets.only(top: 130, right: 20, left: 20),
          child: TextFormField(
            cursorColor: Colors.black87,
            controller: uname,
            obscureText: hidepass,
            obscuringCharacter: "*",
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.drive_file_rename_outline),
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
            padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
            child: TextFormField(
              cursorColor: Colors.black87,
              controller: pass,
              obscureText: hidepass1,
              obscuringCharacter: "*",
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.drive_file_rename_outline),
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
          padding: const EdgeInsets.only(left: 120, right: 120, top: 40),
          child: ElevatedButton(
              onPressed: () async {
                final userList = await DBFunction.instance.getUser();
                findUser(userList);
              },
              child: Text("Login")),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: TextButton(
            onPressed: () {
              Get.to(projreg());
            },
            child: Text("Not a User?..Register here!!"),
          ),
        )
      ]),
    ));
  }

  Future<void> findUser(List<User> userList) async {
    final email = uname.text.trim();
    final password = pass.text.trim();
    bool userFound = false;
    final validate = await validateLogin(email, password);

    if (validate == true) {
      await Future.forEach(userList, (user) {
        if (user.email == email && user.password == password) {
          userFound = true;
        } else {
          userFound = false;
        }
      });
      if (userFound == true) {
        Get.offAll(() => mainscreen());
        // homeee(email: email));
        Get.snackbar("Success", "Login success", backgroundColor: Colors.green);
      } else {
        Get.snackbar("Error", "Incorrect email/password",
            backgroundColor: Colors.blueGrey);
      }
    }
  }

  Future<bool> validateLogin(String email, String password) async {
    if (email != '' && password != '') {
      return true;
    } else {
      Get.snackbar("Error", "Fields cannot be empty",
          backgroundColor: Colors.red);
      return false;
    }
  }
}
