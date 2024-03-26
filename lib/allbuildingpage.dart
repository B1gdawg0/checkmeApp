import 'package:checkme/component/items.dart';
import 'package:checkme/component/searchbar.dart';
import 'package:flutter/material.dart';

class AllBuilding extends StatefulWidget{
  AllBuilding({super.key});


  @override
  State<AllBuilding> createState()=>_AllBuilding();
}


class _AllBuilding extends State<AllBuilding>{
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SearchBarAll(),
        Items(name: "ศูนย์การเรียนรวม 3", like: 5.0, comment: 52, number: 7,path: "sc3.jpeg",),
      ],
    );
  }
}

