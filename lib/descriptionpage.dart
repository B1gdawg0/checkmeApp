import 'package:flutter/material.dart';

class DescriptionPage extends StatefulWidget{
  DescriptionPage({super.key});


  @override
  State<DescriptionPage> createState()=> _DescriptionPage();
}


class _DescriptionPage extends State<DescriptionPage>{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: ListView(
          children: [
            Text("Hello man")
          ],
        ),
    );
  }
}