import 'package:checkme/allbuildingpage.dart';
import 'package:checkme/mappage.dart';
import 'package:checkme/profilepage.dart';
import 'package:flutter/material.dart';

class AllPage extends StatefulWidget{
  AllPage({super.key});

  @override
  State<AllPage> createState() => _AllPage();
}


class _AllPage extends State<AllPage>{
  int currentIndex = 0;
  List<Widget> listPage = [AllBuilding(),Mappage(), Text("Nothing"), Profilepage()];
  List<BottomNavigationBarItem> listMenuItem = [
        BottomNavigationBarItem(icon: Icon(Icons.house),label: "ทั้งหมด",),
        BottomNavigationBarItem(icon: Icon(Icons.map),label: "แผนที่",),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "ที่ถูกใจ"),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "โปรไฟล์")
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: listPage[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: listMenuItem,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      )
    );
  }
}