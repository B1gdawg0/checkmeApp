import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  Login({super.key});

  @override
  State<Login> createState()=>_Login();
}


class _Login extends State<Login>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
        children: [
          const Text("Check Me"),
          const SizedBox(height: 50,),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Username"
            ),
          ),
          const SizedBox(height: 20,),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Password"
            ),
          ),
        ],
      ),
        )
    );
  }
}