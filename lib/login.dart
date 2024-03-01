import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  Login({super.key});

  @override
  State<Login> createState()=>_Login();
}


class _Login extends State<Login>{
  var _KeyForm = GlobalKey<FormState>();
  var userEditController = TextEditingController();
  var passwordEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(margin: const EdgeInsets.all(30.0),
        child: Column(
        children: [
          const SizedBox(height: 50,),

          const Text("Check Me",style: TextStyle(
            fontSize: 70
          ),),

          const SizedBox(height: 50,),

          Form(
            key: _KeyForm,
            child: Column(
              children: [
                TextFormField(
                  controller: userEditController,
                  validator: (value) {
                    if(value == null || value.isEmpty) return "User must not be empty";
                    else if(value.length < 6) return "Username must longer than 5 character";
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person,size: 20,),
                    labelText: "Username"
                  ),
                ),
                const SizedBox(height: 20,),

                TextFormField(
                  controller: passwordEditController,
                  validator: (value){
                    if(value == null || value.isEmpty) return "Password must not be empty";
                    else if(value.length < 6) return "Password must longer than 5 character";
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.password,size: 20,),
                    labelText: "Password"
                  ),
                ),
                const SizedBox(height: 50,),

                Container(
                  padding: const EdgeInsets.fromLTRB(50,10,50,10),
                  child: SizedBox(
                    width: 300,
                    height: 40,
                    child: ElevatedButton(
                    onPressed:() {
                      if(_KeyForm.currentState!.validate()){
                        var user = userEditController.text;
                        var password = passwordEditController.text;

                        // This should be login if else statement !(here (1))

                        print("$user $password");

                        Navigator.pushReplacementNamed(context, "./mappage");
                      }
                    },
                    child: const Text("Login"),
                  ),
                  )
                  
                ),
                const SizedBox(height: 15,),

                const Text("or continue with", style: TextStyle(fontWeight: FontWeight.w600),),

                const SizedBox(height: 15,),

                TextButton(
                  onPressed: (){}, 
                  child: Container(
                      width: 50,
                      height: 50,
                      child: Image.asset("assets/images/googleicon.webp"),
                    )),

                    const SizedBox(height: 30,),


                    const Text("Don't have account yet?", style: TextStyle(fontSize: 12),),
                    const SizedBox(height: 10,),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, "./register"),
                      child: const Text("Register for free!", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),),
                    )
              ]
              ),
            ),

        ],
      ),)
    ));
  }
}