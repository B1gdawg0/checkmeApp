import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SearchBarAll extends StatefulWidget{
  SearchBarAll({super.key});

  @override
  State<SearchBarAll> createState()=>_SearchBarAll();
}

class _SearchBarAll extends State<SearchBarAll>{
  var _key = GlobalKey<FormState>();
  var _controller = SearchController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 30, 20, 30),
      width: 150,
      child: SearchBar(
        hintText: "ค้นหา",
        key: _key,
        controller:_controller,
      ),
    );
  }
}