import 'package:flutter/material.dart';
import 'package:checkme/widgets/bottom_bar/menu_bar.dart';

class Mappage extends StatefulWidget {
  Mappage({super.key});

  @override
  State<Mappage> createState() => _Mappage();
}


class _Mappage extends State<Mappage>{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("#Map"),
        ),
        body: Container(

        ),
        bottomNavigationBar: ,
      ),
    );
  }

  Widget _buildMenuBar(BuildContext context) {
    return MenuBar(
      
    );
  }
}