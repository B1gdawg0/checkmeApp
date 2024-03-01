import 'package:flutter/material.dart';

class Mappage extends StatefulWidget {
  Mappage({super.key});

  @override
  State<Mappage> createState() => _Mappage();
}


class _Mappage extends State<Mappage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("#Map"),),);
  }
}