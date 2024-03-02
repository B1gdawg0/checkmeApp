import 'package:flutter/material.dart';
import 'package:checkme/component/menu_bar.dart';

class Mappage extends StatefulWidget {
  Mappage({super.key});

  @override
  State<Mappage> createState() => _Mappage();
}


class _Mappage extends State<Mappage>{
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("#Map"),
        ),
        body: Container(

        ),
        bottomNavigationBar: MenuBarComponent(currentIndex: currentIndex,),
    );
  }
}