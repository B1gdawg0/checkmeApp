import 'package:checkme/allPage.dart';
import 'package:checkme/allbuildingpage.dart';
import 'package:checkme/dataController.dart';
import 'package:checkme/login.dart';
import 'package:checkme/mappage.dart';
import 'package:checkme/register.dart';
import 'package:checkme/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

Widget CheckMeSetUp(){
  return MaterialApp(
    title: "checkme",
    initialRoute: "./",
    routes: {
      "./":(context) => Login(),
      "./register":(context) => Register(),
      "./mappage":(context)=> Mappage(),
      "./profilepage":(context)=> Profilepage(),
      "./allbuild":(context)=>AllBuilding(),
      "./allpage":(context)=>AllPage()
    },
  );
}

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  initFirebase();
  runApp(CheckMe());
}

Future<void> initFirebase() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
}

class CheckMe extends StatefulWidget{
  CheckMe({super.key});

  @override
  State<CheckMe> createState()=>_CheckMe();
}

class _CheckMe extends State<CheckMe>{
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>DataController(),
      child: CheckMeSetUp(),
      );
  }
}