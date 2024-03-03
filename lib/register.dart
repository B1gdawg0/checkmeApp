import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  Register({super.key});
  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  final _key = GlobalKey<FormState>();
  var userEditController = TextEditingController();
  var passEditController = TextEditingController();
  var confirmEditController = TextEditingController();
  bool canSee = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("#Register"),
      ),
      body: Center(
          child: Container(
        margin: const EdgeInsets.all(50.0),
        child: Form(
            key: _key,
            child: Column(
              children: [
                TextFormField(
                  controller: userEditController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      size: 15,
                    ),
                    label: Text("Username"),
                  ),
                  validator: (value) {
                    if (value!.isEmpty)
                      return "Please enter your email before sign up";
                    if (!EmailValidator.validate(value))
                      return "Please enter valid email";
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: canSee,
                  controller: passEditController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.password,
                      size: 15,
                    ),
                    suffix: GestureDetector(
                      onTap: () {
                        setState(() {
                          canSee = !canSee;
                        });
                      },
                      child: canSee
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                    ),
                    label: Text("Password"),
                  ),
                  validator: (value) {
                    if (value!.isEmpty)
                      return "Please enter your password before sign up";
                    if (value.length < 6)
                      return "Password must longer than 5 character";
                    if (!RegExp("[a-zA-Z]").hasMatch(value))
                      return "Password must contains at least 1 character";
                    if (!RegExp("[0-9]").hasMatch(value))
                      return "Password must contains at least 1 number";
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: canSee,
                  controller: confirmEditController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.password,
                      size: 15,
                    ),
                    suffix: GestureDetector(
                      onTap: () {
                        setState(() {
                          canSee = !canSee;
                        });
                      },
                      child: canSee
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                    ),
                    label: Text("Confirm Password"),
                  ),
                  validator: (value) {
                    if (passEditController.text != value)
                      return "Password and Confirm are not the same";
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_key.currentState!.validate()) {


                        try {
                          var user = userEditController.text;
                          var password = passEditController.text;


                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: user, password: password);


                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                              "Done let's gooo!",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            backgroundColor: Colors.green,
                          ));
                          
                          await Future.delayed(const Duration(seconds: 3));

                          Navigator.pop(context);

                        } on FirebaseAuthException catch (e) {

                          if (e.code == "weak-password") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Weak password. Try a mix of letters, numbers & symbols.",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                backgroundColor: Colors.redAccent,
                              ),
                            );


                          } else if (e.code == "email-already-in-use") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "This email is already in use. Try a different email",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                backgroundColor: Colors.redAccent,
                              ),
                            );


                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Something wrong",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600),
                                ),
                                backgroundColor: Colors.redAccent,
                              ),
                            );
                          }


                        }
                      }
                    },
                    child: const Text("Sign Up"),
                  ),
                )
              ],
            )),
      )),
    );
  }
}
