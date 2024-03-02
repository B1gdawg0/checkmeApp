import 'package:flutter/material.dart';

class MenuBarComponent extends StatefulWidget {
  int currentIndex;
  MenuBarComponent({super.key, required this.currentIndex});
  @override
  State<MenuBarComponent> createState() => _MenuBarState();
  int getcurrentIndex() => currentIndex;
}

class _MenuBarState extends State<MenuBarComponent>{
  List<String> listPage = ['./mappage', './here', './profilepage'];
  List<BottomNavigationBarItem> listMenuItem = [
        BottomNavigationBarItem(icon: Icon(Icons.map),label: "แผนที่",),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "ที่ถูกใจ"),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "โปรไฟล์")
      ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: listMenuItem,
      currentIndex: widget.currentIndex,
      onTap: (value){
        Navigator.pushReplacementNamed(context, listPage[value]);
      },
    );
  }
  
}